% define system constants m, g, d, L, J, R

m = 0.0027; % mass [kg]
g = 9.81;   % gravity [m/s^2]
Rs = 0.06;  % Center of servo to lever-arm [m]
Rb = 0.02;  % Radius of the ball [m]
L = 0.4;    % Length of the balance beam [m]
J = 0.00072;% Moment of inertia of the ball [kg*m^2]


% define PID-gain constants

Kp = 6;
Ki = 0.15;
Kd = 5000;

% Transfer function of the system
H = (m*g*(Rs/L))/((J/(Rb^2)+m)*s^2);

% Transfer function of the controller 
G = pid(Kp, Ki, Kd);

% Transfer function of the closed loop system
sys = (G*H) / (1+G*H);


% Outputs

bode(sys)
M = feedback(sys, 0);
step (M,10)
rlocus (sys)
step (sys)
tf (sys)