function [  ] = robt310_final_project( input_filename )
%ROBT310_FINAL_PROJECT Summary of this function goes here
%   Detailed explanation goes here

    dataDir = './input_files';

    resultsDir = 'output_files/';
    mkdir(resultsDir);
    defaultPyrType = 'halfOctave'; % Half octave pyramid is default as discussed in paper
    scaleAndClipLargeVideos = true; % With this enabled, approximately 4GB of memory is used

    % Uncomment to use octave bandwidth pyramid: speeds up processing,
    % but will produce slightly different results
    %defaultPyrType = 'octave'; 

    % Uncomment to process full video sequences (uses about 16GB of memory)
    %scaleAndClipLargeVideos = false;

    inFile = fullfile(dataDir, input_filename);
    samplingRate = 120; % Hz
    loCutoff = 15;    % Hz
    hiCutoff = 25;    % Hz
    alpha = 50;    
    sigma = 3;         % Pixels
    pyrType = 'octave';
    if (scaleAndClipLargeVideos)
        phaseAmplify(inFile, alpha, loCutoff, hiCutoff, samplingRate, resultsDir,'sigma', sigma,'pyrType', pyrType,'scaleVideo', 0.5);
    else
        phaseAmplify(inFile, alpha, loCutoff, hiCutoff, samplingRate, resultsDir,'sigma', sigma,'pyrType', pyrType,'scaleVideo', 1);
    end
    % The sequence is very large. To save on CPU time, we set
    % pyramid type to 'octave'. If you have the resources or time, feel free to change it
    % to 'halfOctave'

end

