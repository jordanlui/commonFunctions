function [guess] = lookupPose(wR,rotation,wristMat,elbowMat,tolRotation)
    rotDiff = sum(abs(rotation - wR),2);
    guess.ind= find(rotDiff <= tolRotation);  
    guess.lowestDiff = min(rotDiff);
    
    if guess.lowestDiff == 0
        guess.ind = find(rotDiff == guess.lowestDiff,1);
        guess.wristPos = wristMat(guess.ind,:)';
        guess.elbowPos = elbowMat(guess.ind,:)'; 
        guess.rotation = rotation(guess.ind,:);
    else
        if length(guess.ind) > 1
            guess.elbowPos = mean(elbowMat(guess.ind,:))';
            guess.wristPos = mean(wristMat(guess.ind,:))';
            guess.rotation = mean(rotation(guess.ind,:));
        elseif isempty(guess.ind) == 1
            guess.ind = find(rotDiff == guess.lowestDiff,1);
            guess.wristPos = wristMat(guess.ind,:)';
            guess.elbowPos = elbowMat(guess.ind,:)'; 
            guess.rotation = rotation(guess.ind,:);
        else
            guess.wristPos = wristMat(guess.ind,:)';
            guess.elbowPos = elbowMat(guess.ind,:)'; 
            guess.rotation = rotation(guess.ind,:);
        end
    end
    
end