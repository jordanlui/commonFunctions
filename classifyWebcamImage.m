function classifyWebcamImage()
    % Setup camera and model
    camera = webcam;
    nnet = alexnet; % Load Neural net

    %% 
    picture = camera.snapshot; % Take a picture and resize
    picture = imresize(picture,[227,227]);

    % Classify the image
    label = classify(nnet, picture); 

    % Show resulting image and put predicted image in label
    image(picture)
    title(char(label));
end