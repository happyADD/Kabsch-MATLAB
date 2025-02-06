%Kabsch func
function [diff_R,diff_T,det_R] = cal(point_num,points,points_measure,R,T)
n = point_num;
ps_r = points';
ps_m = points_measure';

%质心
p_r = (sum(ps_r')/n)';
p_m = (sum(ps_m')/n)';

%位移向量
q_r = ps_r - p_r;
q_m = ps_m - p_m;

%协方差
H = q_r*q_m';

%奇异值分解
[U,S,V] = svd(H);

%计算结果
R_cal = V*U';

%1 is good
det_R = det(R);

T_cal = p_m - R*p_r;

R_diff = R * R_cal';
theta = acos((trace(R_diff) - 1) / 2);
diff_R = rad2deg(theta); % 将弧度转换为度

trans_diff = T - T_cal;
diff_T = norm(trans_diff); % 欧几里得范数

end