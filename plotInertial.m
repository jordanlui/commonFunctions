function plotInertial(data)
    % Plot inertial sensor data
    subplot(4,1,1), plot(data.acc), title('Acc'), legend('x','y','z')
    subplot(4,1,2), plot(data.gyr), title('Gyro'), legend('x','y','z')
    subplot(4,1,3), plot(data.mag), title('mag'), legend('x','y','z')
    subplot(4,1,4), plot(data.quat), title('quat')
end