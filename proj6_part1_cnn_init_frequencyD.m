function net = proj6_part1_cnn_init_frequencyD(nb_accelerometers)  %_3L
%code for Computer Vision, Georgia Tech by James Hays
%based of the MNIST example from MatConvNet

rng('default');
rng(0);

% constant scalar for the random initial network weights. You shouldn't
% need to modify this.
f=1/100; 

bias = 0.01;
net.layers = {} ;
% nb channels = either 3 (x,y,z for 1 accelerometer) or 9
% (x,y,z,x,y,z,x,y,z for 3 accelerometers)
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(10,1,3*nb_accelerometers,96, 'single'), zeros(1, 96, 'single')}}, ...
                           'biases', bias*ones(1, 96, 'single'), ... % was 20 feature maps
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'conv1') ;
net.layers{end+1} = struct('type', 'relu') ;                       
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 1], ...
                           'stride', 2, ...
                           'pad', 0) ; %[7 7] st=7


%% --------------- added --------------
                  
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(7,1,96,192, 'single'), zeros(1, 192, 'single')}}, ...
                           'biases', bias*ones(1, 192, 'single'), ... % was 40 feature maps
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'conv2') ;
net.layers{end+1} = struct('type', 'relu') ;                       
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 1], ...
                           'stride', 2, ...
                           'pad', 0) ; 



%% -------------------------------
% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(3,1,192,256, 'single'), zeros(1, 256, 'single')}}, ...
%                            'biases', bias*ones(1,256,'single'), ... % was 60 feature maps
%                            'stride', 1, ...
%                            'pad', [1 1 0 0], ... % [TOP BOTTOM LEFT RIGHT]
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv3') ;
% net.layers{end+1} = struct('type', 'relu') ;                       
                  
%% -------------------------------                       
%  net.layers{end+1} = struct('type', 'conv', ...
%                             'weights', {{f*randn(3,1,256,256, 'single'), zeros(1, 256, 'single')}}, ...
%                            'biases', bias*ones(1,256,'single'), ...
%                            'stride', 1, ...
%                            'pad', [1 1 0 0], ... % [TOP BOTTOM LEFT RIGHT]
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv4') ;
% net.layers{end+1} = struct('type', 'relu') ;                       
%% -------------------------------                       
%  net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(3,1,192,256, 'single'), zeros(1, 256, 'single')}}, ...
%                            'biases', bias*ones(1,256,'single'), ... % was 60 feature maps
%                            'stride', 1, ...
%                            'pad', 0, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv3') ;
% net.layers{end+1} = struct('type', 'relu') ;                                             
% net.layers{end+1} = struct('type', 'pool', ...
%                            'method', 'max', ...
%                            'pool', [3 1], ...
%                            'stride', 2, ...
%                            'pad', 0) ; 
%% -------------------------------        
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(6,1,192,500, 'single'), zeros(1, 500, 'single')}}, ...
                           'biases', bias*ones(1,500,'single'), ... % was 120 feature maps
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'fc1') ;
net.layers{end+1} = struct('type', 'relu') ;   
net.layers{end + 1} = struct('type','dropout','rate',0.7);

%% -------------------------------        
% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(1,1,500,500, 'single'), zeros(1, 500, 'single')}}, ...
%                            'biases', bias*ones(1,500,'single'), ... % was 120 feature maps
%                            'stride', 1, ...
%                            'pad', 0, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'fc1') ;
% net.layers{end+1} = struct('type', 'relu') ;   
% net.layers{end + 1} = struct('type','dropout','rate',0.7);

%% -------------------------------                       

% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(1,1,500,500, 'single'), zeros(1, 500, 'single')}}, ...
%                            'biases', bias*ones(1,500,'single'), ...
%                            'stride', 1, ...
%                            'pad', 0, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'fc2') ;
% net.layers{end+1} = struct('type', 'relu') ;   
% net.layers{end + 1} = struct('type','dropout','rate',0.5);
%% -------------------------------                       
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(1,1,500,2, 'single'), zeros(1, 2, 'single')}}, ...
                            'biases', bias*ones(1, 2, 'single'), ...    % was 9 feature maps 
                            'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'fc2') ;
%% -------------------------------
% Loss layer
net.layers{end+1} = struct('type', 'softmaxloss') ;

% Visualize the network
vl_simplenn_display(net, 'inputSize', [50 1 9 10])