% Made by Alec Graves
clear
clc
%% This is the first problem
disp("Problem 1:")
x = randi([3 12], [4 4]);
disp(x);
disp("   sum:")
disp(sum(sum(x)))

% one method:
% disp([[0 0]; [0 0]]);
% x(2:3,2:3) = [[0 0]; [0 0]]

% shorter method:
x(2:3, 2:3) = 0;
disp(x);
Next(0);
%% This is the next problem
disp("Problem 2:")
format long;%display more values
n = 10000000;
disp("   Method 1: random sampling")
X_rand = rand([1, n]);
Y_rand = rand([1, n]);
Y = sqrt(1 - X_rand.*X_rand);
Inside = sum(Y_rand < Y);
% disp(Inside)
Area = Inside/n;
disp(Area * 4)

disp("   Method 2: Riemann")
dx = 1/n;
x = 0:dx:1;
y = sqrt(1-x.*x);
% plot(x, y);
Area = sum(dx*y);
% disp(Area)
disp(Area*4)

disp("   Method 3: Trapezoidal")
Area = sum((y(1:end-1)+y(2:end))/2 * dx);
% disp(Area)
disp(Area*4)

format short;% display fewer values
Next(0);
%% This is the next problem
disp("Problem 3:")
x  = 0;
while(x^2.5 < 1000000)
    x = x + 1;
end
disp(x-1);
Next(0);
%% This is the next problem
disp("Problem 4:");
a = input('   input coefficients of a third order polynomial as an array (ex."[1 2 3 4]").  ');
% example input: [1 2 3 4]
x = 0:0.001:2;
y = polyval(a, x);
plot(x, y);
disp("   Plotting complete.");

Next(1);
%% This is the next problem
disp("Problem 5:");

x = randi([-10 10], [1 10]);
disp("   Vector:");
disp(x);

[pe, po, ne, no] = vecFunc(x);

disp("   Positive Evens:");
disp(pe);
disp("   Positive Odds:");
disp(po)
disp("   Negative Evens:");
disp(ne);
disp("   Negative Odds:");
disp(no);

Next(0);
%% This is the next problem
disp("Problem 6:");
x = 0:0.001:2*pi;
y = 2*sin(x) - 3*cos(2*x);
p = plot(x, y);

% plot params:
p.LineWidth = 2;
p.LineStyle = '-';
p.Color = 'black';
p.Marker = '^';
p.MarkerSize = 10;
p.MarkerIndices = floor(length(y)/16):floor(length(y)/16):length(y);
xticks(0:(pi/2):length(y))
title('Effect of x on 2*sin(x) - 3*cos(2*x)');

disp("   Plotting complete.");
Next(1);
%% Close plots
function [] = Next(ClrPlot)
    disp("Press any key to continue...");
    if ClrPlot
        waitforbuttonpress;
        delete(findall(0,'Type','figure'));
    else % no plot to clear
        pause;
    end
    clc;
end
%% These are function Definitions
function [pEven, pOdd, nEven, nOdd] = vecFunc(vals)
    pEven = [];
    pOdd = [];
    nEven = [];
    nOdd = [];
    for v = vals
        if mod(v, 2)% odd
            if v < 1
                nOdd = [nOdd v];
            else
                pOdd = [pOdd v];
            end
        else% even
            if v < 1
                nEven = [nEven v];
            else
                pEven = [pEven v];
            end
        end
    end
end
