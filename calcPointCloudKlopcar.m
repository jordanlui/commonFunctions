function [rotation,elbowPos,wristPos,angles] = calcPointCloudKlopcar(ROM,stepSize)
% Create point cloud of possible elbow and arm locations
% ROM input angles are for [ShFlx, ShAbd, ShRot, ElbFlx, ElbPro]
% Input should be a 5x2 matrix
% Using Klopcar 2005 method (angle dependencies)

load('LuiArm2018.mat')
if nargin <2
    stepSize = 20;
end
printoutStep = 2e4;

disp('Starting permuations. Expected number iterations:')
numIter = ceil(prod((ROM(:,2) - ROM(:,1))./stepSize));
angles = zeros(numIter,5);
elbowPos = zeros(numIter,3);
wristPos = zeros(numIter,3);
rotation = zeros(numIter,9);

cnt = 1;
tic

for i=ROM(2,1):stepSize:ROM(2,2)
    qA = i; % Abduction angle for this iteration
    for j = (ROM(1,1) + qA/3):stepSize:(ROM(1,2) - qA/6)
        qF = j; % Flexion angle
        for k = (ROM(3,1) +qA*7/9 -qF/9 +qA*qF*2/810):stepSize:(ROM(3,2) +qA*4/9 -qF*5/9 + qA*qF*5/810)
            for l = ROM(4,1):stepSize:ROM(4,2)
                for m = ROM(5,1):stepSize:ROM(5,2)
                    [pose] = armPose(dhparams,[i,k,j,l,0,0,m]');
                    angles(cnt,:) = [i j k l m];
                    rotation(cnt,:) = reshape(pose.wrist.R,[1,9]);
                    elbowPos(cnt,:) = pose.elbow.pos;
                    wristPos(cnt,:) = pose.wrist.pos;
                    cnt = cnt + 1;
                    if mod(cnt,printoutStep)==0
                        cnt
                    end
                end
            end
        end
    end
end

toc

disp(cnt)


end