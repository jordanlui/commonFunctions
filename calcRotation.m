function rot = calcRotation(rot)
    % Calculation rotation change between two time stamps for a specific
    % joint. 
    % Input: rot struct with start and end rotation in 3x3 matrix
    
    rot.delta = rot.end' * rot.start;
    rot.degrees = rotm2eul(rot.end' * rot.start) * 180/pi;
    rot.tot = sum(abs(rot.degrees));

end