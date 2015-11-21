function [ R,V ] = fnKepsToCarts( a,e, i, omega,BigOmega, nu )
% fnKepsToCarts converts from Keplerian elements to Cartesian elements

% Adapted from Algorithm 6: RANDV

% Assumption: Orbit is elliptical!
%                      not equatorial!

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

%% Declare constants
mu_E = 398600.4418;     % Earth’s gravitational parameter [km^3/s^2]

%% Calculations

% semi-parameter 
p = a*(1-e^2);

% pqw: perifocal coordinate system
% Find R and V in pqw coordinate system
R_pqw(1,1) = p*cosd(nu)/(1 + e*cosd(nu));
R_pqw(2,1) = p*sind(nu)/(1 + e*cosd(nu));
R_pqw(3,1) = 0;  
V_pqw(1,1) = -sqrt(mu_E/p)*sind(nu);
V_pqw(2,1) =  sqrt(mu_E/p)*(e + cosd(nu));
V_pqw(3,1) =   0;

% Then rotate into ECI frame
R = fnRotate3(-BigOmega)*fnRotate1(-i)*fnRotate3(-omega)*R_pqw;
V = fnRotate3(-BigOmega)*fnRotate1(-i)*fnRotate3(-omega)*V_pqw;

end
