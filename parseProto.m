function data = parseProto(raw)
    % Parse proto data into a struct. Version Mar 2018
    % 2018 Mar Parsing Magnetometer.
    data.omron = raw(:,1:16);
    data.acc = raw(:,17:19);
    data.gyr = raw(:,20:22);
    data.mag = raw(:,23:25);
    data.quat = raw(:,26:29);
    data.eul = quat2eul(data.quat);
end