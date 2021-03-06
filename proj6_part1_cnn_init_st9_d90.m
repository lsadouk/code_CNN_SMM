function net = proj6_part1_cnn_init_st9_d90(nb_accelerometers)
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
                           'weights', {{f*randn(9,1,3*nb_accelerometers,96, 'single'), zeros(1, 96, 'single')}}, ...
                           'biases', bias*ones(1, 96, 'single'), ... %4-->20
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'conv1') ;
%net.layers{end+1} = struct('type', 'sigmoid') ; % was 'relu'    'leak',  '0.01'                
net.layers{end+1} = struct('type', 'relu') ;
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 1], ...
                           'stride', [2 1], ...
                           'pad', 0) ; %[7 7] st=7


%% --------------- added --------------
                  
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(7,1,96,192, 'single'), zeros(1, 192, 'single')}}, ...
                           'biases', bias*ones(1, 192, 'single'), ...
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
                           'stride', [2 1], ...
                           'pad', 0) ; 



%% -------------------------------
% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(3,3,50,150, 'single'), zeros(1, 150, 'single')}}, ...
%                            'biases', bias*ones(1,150,'single'), ...
%                            'stride', 1, ...
%                            'pad', 1, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv3') ;
% net.layers{end+1} = struct('type', 'relu') ;                       
                  
%% -------------------------------                       
%  net.layers{end+1} = struct('type', 'conv', ...
%                             'weights', {{f*randn(3,3,150,150, 'single'), zeros(1, 150, 'single')}}, ...
%                            'biases', bias*ones(1,150,'single'), ...
%                            'stride', 1, ...
%                            'pad', 1, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv4') ;
% net.layers{end+1} = struct('type', 'relu') ;                       
%% -------------------------------                       
 net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(5,1,192,300, 'single'), zeros(1, 300, 'single')}}, ...
                           'biases', bias*ones(1,300,'single'), ...
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'conv3') ;
net.layers{end+1} = struct('type', 'relu') ;                                             
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 1], ...
                           'stride', [2 1], ...
                           'pad', 0) ; 
%% -------------------------------        
% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{f*randn(7,1,8,10, 'single'), zeros(1, 10, 'single')}}, ...
%                            'biases', bias*ones(1,10,'single'), ...
%                            'stride', 1, ...
%                            'pad', 0, ...
%                            'filtersLearningRate', 1, ...
%                            'biasesLearningRate', 2, ...
%                            'filtersWeightDecay', 1, ...
%                            'biasesWeightDecay', 0, ...
%                            'name', 'conv4') ;
% net.layers{end+1} = struct('type', 'relu') ;   
% %net.layers{end + 1} = struct('type','dropout','rate',0.5);
%% -------------------------------        
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(5,1,300,500, 'single'), zeros(1, 500, 'single')}}, ...
                           'biases', bias*ones(1,500,'single'), ...
                           'stride', 1, ...
                           'pad', 0, ...
                           'filtersLearningRate', 1, ...
                           'biasesLearningRate', 2, ...
                           'filtersWeightDecay', 1, ...
                           'biasesWeightDecay', 0, ...
                           'name', 'fc1') ;
net.layers{end+1} = struct('type', 'relu') ;  
net.layers{end + 1} = struct('type','dropout','rate',0.5);

%% -------------------------------                       
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(1,1,500,2, 'single'), zeros(1, 2, 'single')}}, ...
                            'biases', bias*ones(1, 2, 'single'), ...   
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
vl_simplenn_display(net, 'inputSize', [90 1 9 10])