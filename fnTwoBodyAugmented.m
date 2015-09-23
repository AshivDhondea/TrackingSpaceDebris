function [ Xdot ] = fnTwoBodyAugmented( t,X )
% fnTwoBodyAugmented implements the vector function F in DX = FX as well as
% the state transition matrix's DE.

% We employ an augmented state vector: the first four elements in X are the
% states (x, y, xdot, ydot). The next 16 elements are the elements from
% the state transition matrix reshaped into a column vector.

% Refer to fnTwoBody.m for the implementation of the differential equation 
% DX = FX only.

% Author: Ashiv Dhondea, RRSG, UCT.
% Date: 22 September 2015

%% Parameters
% X(1) == x i.e. x component of position
% X(2) == y i.e. y   "           "
% X(3) == xdot i.e. first derivative of x position
% X(4) == ydot i.e.                     y   

% Xdot == derivative of X

%% Calculations
%Calculate the range
r = norm(X(1:2));
mu = 1;

% Explanation:
% Xdot(1) = X(3); D x = xdot
% Xdot(2) = X(4); D y = ydot
% Xdot(3) = -mu/r^3 X(1); D xdot = -mu/r^3 x
% Xdot(4) = -mu/r^3 X(2); D ydot = -mu/r^3 y
% These are the first 4 elements in Xdot

% The state transition matrix's elements are the last 4 elements in the
% input state vector
Phi = reshape(X(end-16+1:end),4,4);% extract Phi matrix from the input vector X

% Find matrix A (state sensitivity matrix)

% We start with a matrix of zeros and then add in the non-zero elements.
Amatrix = zeros(4,4);
Amatrix(1,3) = 1;
Amatrix(2,4) = 1;
Amatrix(3,1) = -mu*(r^2 - 3*X(1)^2)/r^5;
Amatrix(3,2) = mu*3*X(1)*X(2)/r^5;

Amatrix(4,1) = Amatrix(3,2);
Amatrix(4,2) = -mu*(r^2 - 3*X(2)^2)/r^5;


% The state transition matrix's differential equation.
PhiDot = Amatrix*Phi; % Amatrix is a time dependent variable.i.e. not constant


Xdot = [X(3);X(4);-X(1)/r^3; -X(2)/r^3; reshape(PhiDot,numel(PhiDot),1)];

end
