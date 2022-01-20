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
clear
clc

%% Adding path to the benchmark functions code
addpath("/Users/nitheshrajmohan/Downloads/")

%% Parameters
Population_size = 30;
Num_Movement    = 50;
Dimension       = 2;
Freq_Min        = 0;
Freq_Max        = 1;
Loudness        = 0.5;
PulseRate       = 0.5;
Gamma           = 0.5;
Accuracy        = 3;

%% Selecting the optimizer function
optimizer = "Levi";
[x_range, y_range] = Ranges(optimizer);

%% Initialising the population
for i = 1: Population_size
    Population(i,1) = (x_range(2)-x_range(1)).*rand(1,1)+x_range(1);
    Population(i,2) = (y_range(2)-y_range(1)).*rand(1,1)+y_range(1);
    Fitness(i,1) =  Optimization_func(Population(i,1), Population(i,2), optimizer, "Optimizer");    
end

[Best, ind] = min(Fitness); 

%% Bat dynamics
Bat_Loudness = ones(Population_size,1);
Bat_PulseRate = zeros (Population_size,1);
Bat_Frequency = zeros(Population_size, Dimension);
Bat_Velocity = Bat_Frequency;

%% PLot the bat location
points = Population_Points(Population, optimizer, []);

%% Run the simulation
tic
for movements = 1: Num_Movement
    for bat = 1: Population_size
        % update the dynamics
        Bat_Frequency (bat,:) = Freq_Min + (Freq_Max - Freq_Min)*rand(1, Dimension);
        Bat_Velocity (bat,:) = (Population(ind,:) - Population(bat, :)).*Bat_Frequency(bat,:);
        Position = Population (bat,:) + Bat_Velocity (bat, :);
        
        % perform a random walk
        if rand < Bat_PulseRate(bat,1)
            Position = Position + mean (Bat_Loudness)*rand(1, Dimension);
        end
        
        % scale the population
        Position = Population_Scaling(Position,x_range,y_range);
        
        % update the fitness
        [Fitness_Value, Target] = Optimization_func(Position(1), Position(2), optimizer, "Optimizer");
        if Fitness_Value < Fitness(bat,1)
            Fitness(bat,1) = Fitness_Value;
            Population(bat,:) = Position;
            Bat_Loudness(bat, 1) = Loudness*Bat_Loudness(bat,1);
            Bat_PulseRate(bat,1) = PulseRate*(1-exp(-Gamma*movements));
            
            if Fitness_Value < Best
                ind = bat;
                Best = Fitness_Value;
            end
            
            
        end
          
        
        
    end
    
    points = Population_Points(Population, optimizer, points);
    

end

t=toc;
fprintf("Simulation is completed after %.4f seconds (Movements: 0.0f)\n",t,movements);
fprintf("Best Solution is: x = %.5f, y = %.5f with the fitness of %.5f \n",Population(ind,1), Population(ind,2), Best);
    

