%{Standard Bat Optimization Algorithm
%References                                                               %
% 1) Yang X.S. (2010). A New Metaheuristic Bat-Inspired Algorithm, In:    %
%   Nature-Inspired Cooperative Strategies for Optimization (NICSO 2010), %
%   Studies in Computational Intelligence, vol 284. Springer, Berlin.     %
%   https://doi.org/10.1007/978-3-642-12538-6_6                           %
% 2) Yang X.S. (2014). Nature-Inspired Optimization Algorithms, Elsevier. %
% 3) XS Yang (2020). The Standard Bat Algorithm (BA)
%   (https://www.mathworks.com/matlabcentral/fileexchange/74768-the-standard-bat-algorithm-ba),
%    MATLAB Central File Exchange.%
% 
% THE LETTER OF AUTHORIZATION FOR REPRODUCING THE CODE IS OBTAINED %
%}

function [z, min_val]= Optimization_func(x, y, func, mode)

    optimizer = str2func(func);
    
    if mode == "Optimizer"
        [z, min_val] = optimizer(x,y);
    else 
        [x_range, y_range] = Ranges(func);
        x = linspace(x_range(1), x_range(2), 101);
        y = linspace(y_range(1), y_range(2), 101);
        
        for j = 1:length(x)
            for i = 1:length(y)
                z(j,i)= optimizer(x(j),y(i));
                
            end
        end
       figure (1)
       cla
       xlabel('y')
       ylabel('x')
       if mode == "Surf"
           surf(y,x,z)
           zlabel('Fitness')
       elseif mode == "Contour"
           contour(y,x,z)
       end
        
    end
    
end

function[z, min_val]= Beale(x,y)
    z = (1.5 - x + x*y)^2 + (2.25 - x + x*y^2)^2 + (2.625 - x + x*y^3)^2;
    min_val = 0;
end

function[z, min_val] = Ackley(x,y)
    z = -20*exp(-0.2*sqrt(0.5*(x^2 + y^2))) - exp(0.5*(cos(2*pi*x) + cos(2*pi*y))) + exp(1) + 20;
    min_val = 0;
end

function[z, min_val] = CrossTray(x,y)
     z = -0.0001 * (abs(sin(x) * sin(y) * exp(abs(100 - (sqrt(x^2 + y^2))/pi))) + 1)^0.1;
     min_val = -2.063;
end

function[z, min_val] = Levi(x,y)
    z = sin(3*pi*x)^2 + (x-1)^2 * (1+sin(3*pi*y)^2) + (y-1)^2 * (1 + sin(2*pi*y)^2);
    min_val = 0;
end

function[z, min_val] = GoldsteinPrice (x,y)
     z= (1+(x + y + 1)^2 * (19 - 14*x + 3*x^2 - 14*y + 6*x*y + 3*y^2)) * (30 +(2*x - 3*y)^2* (18 - 32*x + 12*x^2 + 48*y - 36*x*y + 27 * y^2));
     min_val = 3;
end

function[z, min_val] = Booth (x,y)
    z = (x + 2*y - 7)^2 + (2*x + y - 5)^2;
    min_val = 0;
end

function [z, min_val] = Bukin (x,y)
    z = 100 * sqrt(abs(y-0.01*x^2)) + 0.01*abs(x + 10);
    min_val = 0;
end 

function [z, min_val] = Eggcrate (x,y)
    z = x^2 + y^2 + 25*(sin(x)^2 + sin(y)^2);
    min_val = 0;
end

function [z, min_val] = Matyas (x,y)
    z = 0.26*(x^2 + y^2 - 0.48*x*y);
    min_val = 0;
end

function [z, min_val] = McCormick (x,y)
    z = sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y +1;
    min_val =-1.9133;
end






