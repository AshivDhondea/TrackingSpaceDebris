% Test function fnKepsToCarts

% Conversion of Keplerian orbital elements into Cartesians

% example 2-3 in Vallado book

%% Author:
% Ashiv Dhondea, RRSG, UCT
% Date: 21/11/15

%% License
% Copyright (c) 2015 Ashiv Dhondea

% Permission is hereby granted, free of charge, to any person obtaining a 
% copy of this software and associated documentation files (the "Software")
% , to deal in the Software without restriction, including without 
% limitation the rights to use, copy, modify, merge, publish, distribute, 
% sublicense, and/or sell copies of the Software, and to permit persons to 
% whom the Software is furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
% OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
% THE USE OR OTHER DEALINGS IN THE SOFTWARE.

%% Parameters
% a = semi-major axis [km]
% e = eccentricity []
% i = inclination [deg]
% omega = argument of perigee [deg]
% BigOmega = RAAN:right ascension of the ascending node [deg]
% nu = true anomaly

%% Reference:
% 1. Fundamentals of astrodynamics and application. Vallado

%% Clear memory
clc;
clear;
close all;

%% Declare Keplerians
p = 11067.790; %[km] % p relates the semi-major axis a with the eccentricity e.

e = 0.83285;
i = 87.87; %[deg]
BigOmega = 227.89; % [deg]
omega = 53.38; % [deg]
nu = 92.335; % [deg]

a = p/(1-e^2);

[ R,V ] = fnKepsToCarts( a,e, i, omega,BigOmega, nu )

% These results agree with the values from the book.
