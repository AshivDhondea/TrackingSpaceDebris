% Exercise 10 on Page 268 in Statistical Orbit Determination
% Schutz, Tapley, Born

% Author: Ashiv Dhondea, RRSG, UCT
% Date: 22 September 2015

% This project calls the functions fnTwoBody.m, fnTwoBodyAugmented.m

%% Clear memory
clc; clear; close all;

%% Declare variables

% Initial conditions
X0 = [1.0;0;0;1.0];

time = [1,100];

%% Numerical integration with ode23s
% ode23s: solves STIFF differential equations with low accuracy

% Set the tolerance values for the inbuilt MATLAB integrator
options = odeset('RelTol',1e-3,'AbsTol',1e-3);

% Generate "true" solution by numerically integrating the differential
% equations in the fundamental function
[T,X] = ode23s(@fnTwoBody,time,X0,options); % Integrator for differential equations

% Plot the "true" trajectory
figure(1);
xlim([min(X(:,1)) max(X(:,1))])
ylim([min(X(:,2)) max(X(:,2))])
plot(X(:,1),X(:,2),'b-','MarkerSize',20);
hold on;
title('Orbit Simulation with ode23s ');
plot ( X(1,1), X(1,2), 'g.', 'MarkerSize', 20 );
plot ( X(end,1), X(end,2), 'c.', 'MarkerSize', 20 );
xlabel('x');
ylabel('y');
hold on;
grid on;
axis equal;
plot(0,0,'r.','MarkerSize',40);
hold off;

% Plot evolution of x and y coordinates over time
figure(2);
subplot(2,1,1);
plot(T,X(:,1));
grid on;
title('Evolution of x and y coordinates over time')
xlabel('t')
ylabel('x')
subplot(2,1,2);
plot(T,X(:,2));
grid on;
xlabel('t')
ylabel('y')

%% [Part b]

% Perturbation vector
deltaX0 = [1e-6;-1e-6;1e-6;1e-6];

% Perturb the initial conditions
Xnominal = X0 + deltaX0; % nominal trajectory

% The state transition matrix is initialized to the identity matrix
Phi0 = eye(4);

% Augment the state vector by the elements of the state transition matrix.
Xini = [Xnominal;reshape(Phi0,numel(Phi0),1)];

% Numerically integrate nominal trajectory
[Tnom,Xaugmented] = ode23s(@fnTwoBodyAugmented,time,Xini,options);

% Plot the nominal trajectory
figure;
xlim([min(Xaugmented(:,1)) max(Xaugmented(:,1))])
ylim([min(Xaugmented(:,2)) max(Xaugmented(:,2))])
plot(Xaugmented(:,1),Xaugmented(:,2),'b-','MarkerSize',20);
hold on;
title('Nominal trajectory');
plot ( Xaugmented(1,1), Xaugmented(1,2), 'g.', 'MarkerSize', 20 );
plot ( Xaugmented(end,1), Xaugmented(end,2), 'c.', 'MarkerSize', 20 );
xlabel('x');
ylabel('y');
hold on;
grid on;
axis equal;
plot(0,0,'r.','MarkerSize',40);
hold off;

% Plot evolution of x and y coordinates over time
figure;
subplot(2,1,1);
plot(Tnom,Xaugmented(:,1));
grid on;
title('Evolution of x and y coordinates over time')
xlabel('t')
ylabel('x')
subplot(2,1,2);
plot(Tnom,Xaugmented(:,2));
grid on;
xlabel('t')
ylabel('y')

%% [Part c]

% Gather state transition matrix
Phi100 = reshape(Xaugmented(100,5:20),4,4);

Phi100Inv = inv(Phi100);

result = Phi100Inv*Phi100
% Notice that the result is the identity matrix. The off diagonal elements
% are basically equal to 0. I think they're not zero because of finite
% wordlength and roundoff error??

%% [Part d]
% I can't really do this part because the integrator ode23s has a variable
% stepsize, so the stepsize used to integrate the true trajectory is not
% the same as that used to integrate the nominal trajectory.
