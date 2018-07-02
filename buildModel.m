function [yX y X] =  buildModel(data)
    % Build matrix of data for ML model
    
    % Omron analysis data
    [omron.row,omron.col,omron.quadrant] = omronAnalysis(data.omron);

    % Build a learning matrix
    X = [data.omron data.acc data.gyr data.mag data.quat data.eul omron.row.means omron.row.stds omron.col.means omron.col.stds omron.quadrant.means omron.quadrant.stds data.wrist.rot];
    X = [X [zeros(1,size(X,2)); diff(X,1)]];
    y = data.distWristChest;
    
    % Only pass values that are valid distances
%     yX = yX(data.distCheck,:);
    y = y(data.distCheck);
    X = X(data.distCheck,:);
    
    % Combine values
    yX = [y X];
   
end
