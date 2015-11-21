function [ T ] = fnRotate1( alpha )
% fnRotate1 implements the rotation matrix ROT3 from 
% Fundamentals of astrodynamics and application. Vallado

% Note that this function accepts angles in degrees!

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

T = [1,0,0;0,cosd(alpha),sind(alpha); 0, -sind(alpha),cosd(alpha)];
end
