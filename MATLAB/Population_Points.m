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
function points = Population_Points(Population, optimizer, points)

    if isempty(points)
        figure (1)
        cla
        hold on
        Optimization_func([],[],optimizer,"Contour")
        
    else
        reset(points);
    end
    
    points = scatter (Population(:,1), Population(:,2), "ko" , "MarkerFaceColor", "k");
    pause(0.1)
    drawnow()
    
end