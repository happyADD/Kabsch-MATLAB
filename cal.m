%Kabsch func
function [matrix,det_R] = cal(point_num,points,points_measure,R,T)
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


real_matrix = [R,T;0,0,0,1];
measure_matrix = [R_cal,T_cal;0,0,0,1];

matrix = real_matrix - measure_matrix;
end