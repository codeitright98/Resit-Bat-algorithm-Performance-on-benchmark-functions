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
function [x,y] = Ranges(func)

    if func == "Beale"
        x(1) = -4.5; x(2) = 4.5;
        y(1) = -4.5; y(2) = 4.5; 
        
    elseif func == "Ackley" || func == "Eggcrate"
        x(1) = -5; x(2) = 5;
        y(1) = -5; y(2) = 5; 
        
        
    elseif func == "CrossTray" || func == "Levi" || func == "Booth" || func == "Matyas"
        x(1) = -10; x(2) = 10;
        y(1) = -10; y(2) = 10; 
        
    elseif func == "GoldsteinPrice"
       x(1) = -2; x(2) = 2;
       y(1) = -2; y(2) = 2; 
       
    elseif func == "Bukin"
        x(1) = -15; x(2) = -5;
        y(1) = -3; y(2) = 3; 
        
    elseif func == "McCormick"
        x(1) = -1.5; x(2) = 4.0;
        y(1) = -3.0; y(2) = 4.0; 
        
    end

end