function rot = compareAngleChange(data,i1,i2)
% Compare angle change between ART and proto device for given time indices

% Check pose change for the wrist ART
rot.ART.start = reshape(data.joints{1}.rot(i1,:), [3 3]);
rot.ART.end = reshape(data.joints{1}.rot(i2,:), [3 3]);
rot.ART = calcRotation(rot.ART);
% rot.ART.tot

% Angle change for the proto
rot.Proto.start = data.rot(:,:,i1);
rot.Proto.end = data.rot(:,:,i2);
rot.Proto = calcRotation(rot.Proto);
% rot.Proto.tot

end