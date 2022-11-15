% Define laplace-variable
syms('s')


% Define system constants m, g, d, L, J, R

m = 0.0027; % mass [kg]
g = 9.81;   % gravity [m/s^2]
Rs = 0.06;  % Center of servo to lever-arm [m]
Rb = 0.02;  % Radius of the ball [m]
L = 0.4;    % Length of the balance beam [m]
J = 0.00072;% Moment of inertia of the ball [kg*m^2]


% Define PID-gain constants
Kp = 6;
Ki = 0.15;
Kd = 5000;


% Transfer function of the system
num = [m*g*(Rs/L)];
den = [(J/(Rb^2)+m) 0 0];
H = tf(num, den);


% Transfer function of the controller 
G = pid(Kp, Ki, Kd);


% Open loop transfer function
sys = H*G;


% Closed loop transfer function
sys_CL = feedback(sys, 1);


% Outputs
tf(sys_CL)
pole(sys_CL)
step(sys_CL);