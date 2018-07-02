function plotQuiver(p,R)
    lineWidth = 3;
    lineScale = 150;
    if nargin < 2
        R = eye(3);
    end
    x(1) = p(1);
    y(1) = p(2);
    z(1) = p(3);
    ox(1) = x(1);
    oy(1) = y(1);
    oz(1) = z(1);
    if length(R) == 3
        ux(1) = R(1,1,1:1);
        vx(1) = R(2,1,1:1);
        wx(1) = R(3,1,1:1);
        uy(1) = R(1,2,1:1);
        vy(1) = R(2,2,1:1);
        wy(1) = R(3,2,1:1);
        uz(1) = R(1,3,1:1);
        vz(1) = R(2,3,1:1);
        wz(1) = R(3,3,1:1);
    else
        ux(1) = R(1);
        vx(1) = R(2);
        wx(1) = R(3);
        uy(1) = R(4);
        vy(1) = R(5);
        wy(1) = R(6);
        uz(1) = R(7);
        vz(1) = R(8);
        wz(1) = R(9);
    end

    hold on
    quivXhandle = quiver3(ox, oy, oz, ux, vx, wx, lineScale, 'r' ,'LineWidth',lineWidth);
    quivYhandle = quiver3(ox, oy, oz, uy, vy, wy, lineScale, 'g', 'LineWidth',lineWidth);
    quivZhandle = quiver3(ox, oy, oz, uz, vz, wz, lineScale, 'b', 'LineWidth',lineWidth);
    
    
    
    hold off
end