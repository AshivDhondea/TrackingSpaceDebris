function [ Xdot ] = fnTwoBody( t,X )
% fnTwoBody calculates the derivative of the state vector.
% DX = F(X).
% The vector function F is implemented in this code.
% F is sometimes called the fundamental function.

% Author: Ashiv Dhondea, RRSG, UCT.
% Date: 22 September 2015

%% Parameters
% X(1) == x i.e. x component of position
% X(2) == y i.e. y   "           "
% X(3) == xdot i.e. first derivative of x position
% X(4) == ydot i.e.                     y   

% Xdot == derivative of X

%% Calculations

%mu =1;

%Calculate the range
r = norm(X(1:2));

% Explanation:
% Xdot(1) = X(3); D x = xdot
% Xdot(2) = X(4); D y = ydot
% Xdot(3) = -mu/r^3 X(1); D xdot = -mu/r^3 x
% Xdot(4) = -mu/r^3 X(2); D ydot = -mu/r^3 y

Xdot = [X(3);X(4);-X(1)/r^3; -X(2)/r^3];

end
