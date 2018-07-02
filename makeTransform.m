% Make transform matrix from joint data and a time index

function T = makeTransform(joint,k)
T= rotm2tform(reshape(joint.rot(k,:),[3,3]));
T(1:3,4) = joint.pos(k,:)';
end