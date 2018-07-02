function q = cleanQuaternionTol(q,tol)
    % Removes zero values in quaternion data by looking for changes greater
    % than tolerance value
    
    % 2018 Mar 20: Working. Note careful selection required for tolerance
    % values
    
    tolGradSearch = 4; % Maximum number of points that we will look ahead
    if nargin < 2
        tol = 10000;
    end
    diff1 = diff(q,1);
    
    % Step 1: Look for singular value spikes, which can be easily rejected
    for i = 2:length(diff1)-1
        if sum(abs(diff1(i,:))) > tol && sum(abs(diff1(i+1,:))) > tol
            q(i+1,:) = (q(i,:) + q(i+2,:))./2;
        end
    end
    
    % Step 2: Second pass to remove remaining high value gradients
    diff1 = diff(q,1);
    for i = 2:length(diff1)-1-tolGradSearch
        % Look for a gradient that exceeds tolerance
        if sum(abs(diff1(i,:))) > tol
            % Look for a second gradient change within our search window
            if any(sum(abs(diff1(i+1:i+tolGradSearch,:)),2) >  tol)
                % Having found a complement to our first gradient,
                % we interpolate
                j = find(sum(abs(diff1(i+1:i+tolGradSearch,:)),2) > tol) + 1 + i;
                vq = interp1([i;j], [q(i,:);q(j,:)], [i+1:j-1]);
                q([i+1:j-1],:) = vq;
            end
        end
    end
        
    

end