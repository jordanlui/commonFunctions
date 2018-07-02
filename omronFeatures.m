function [row,col,quadrant] = omronFeatures(omron)
    % Consider Omron variances by columns and by rows
    % Return stats by column, row, quadrant
    for i=1:4
        row.ind{i} = i:4:16;
        col.ind{i} = 4*(i-1)+1:4*(i-1)+4;
    end
    quadrant.ind{1} = [1 2 5 6];
    quadrant.ind{2} = [3 4 7 8];
    quadrant.ind{3} = [9 10 13 14];
    quadrant.ind{4} = [11 12 15 16];

    for i = 1:4
        row.mean{i} = mean(omron(:,row.ind{i}),2);
        col.mean{i} = mean(omron(:,col.ind{i}),2);
        quadrant.mean{i} = mean(omron(:,quadrant.ind{i}),2);

        row.std{i} = std(omron(:,row.ind{i}),[],2);
        col.std{i} = std(omron(:,col.ind{i}),[],2);
        quadrant.std{i} = std(omron(:,quadrant.ind{i}),[],2);
    end
    
    % Other summary values in matrix
    row.means  = [row.mean{1} row.mean{2} row.mean{3} row.mean{4}];
    col.means  = [col.mean{1} col.mean{2} col.mean{3} col.mean{4}];
    quadrant.means  = [quadrant.mean{1} quadrant.mean{2} quadrant.mean{3} quadrant.mean{4}];
    
    row.stds  = [row.std{1} row.std{2} row.std{3} row.std{4}];
    col.stds  = [col.std{1} col.std{2} col.std{3} col.std{4}];
    quadrant.stds  = [quadrant.std{1} quadrant.std{2} quadrant.std{3} quadrant.std{4}];
    
    % Simple tidy for our ML analysis Study3 Jun 2018
    row = row.means;
    col = col.means;
    quadrant = quadrant.means;

end