function plotArmPose(data,i)
    % Plot arm pose, with rotation matrix
    if nargin < 2
        i = 1;
    end
    xlabel('x'),ylabel('y'), zlabel('z')
    hold on
    plotQuiver(data.shoulder2.pos(i,:)',data.shoulder2.rot(i,:))
    plotQuiver(data.arm.pos(i,:)',data.arm.rot(i,:))
    plotQuiver(data.elbow.pos(i,:)',data.elbow.rot(i,:))
    plotQuiver(data.forearm.pos(i,:)',data.forearm.rot(i,:))
    plotQuiver(data.wrist.pos(i,:)',data.wrist.rot(i,:))
    plotQuiver([0,0,0],eye(3))
    hold off
end