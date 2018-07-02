function checkQuaternion(data)
% Plot out the orientation data to check for issues
ax(1) = subplot(2,2,1);, plot(data.quat), title('original quat'), legend('w','x','y','z')
ax(2) = subplot(2,2,2);, plot(data.quatClean), title('Cleaned Quaternion')
ax(3) = subplot(2,2,3);, plot(data.eul), title('Euler')
ax(4) = subplot(2,2,4);, plot(quat2eul(data.quatClean)), title('Cleaned Euler')
linkaxes(ax(1:2),'xy')
linkaxes(ax(3:4),'xy')
end
