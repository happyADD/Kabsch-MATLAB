function [R, T] = randomRT()
    % 生成一个随机的单位向量作为旋转轴
    v = randn(3, 1); % 随机生成一个三维向量
    v = v / norm(v); % 将向量归一化

    % 随机生成旋转角度
    theta = rand * 2 * pi; % 在0到2π之间随机选择一个角度

    % 构建旋转矩阵
    c = cos(theta);
    s = sin(theta);
    t = 1 - c;
    x = v(1);
    y = v(2);
    z = v(3);

    R = [
        t*x^2 + c,     t*x*y - s*z,   t*x*z + s*y;
        t*x*y + s*z,   t*y^2 + c,     t*y*z - s*x;
        t*x*z - s*y,   t*y*z + s*x,   t*z^2 + c
    ];

    % 随机生成沿每个轴的平移距离
    % 如果需要限制平移距离在特定范围内，可以调整这里的生成逻辑
    % 目前使用标准正态分布（均值为0，方差为1）
    dx = randn; % 可根据需要调整范围
    dy = randn;
    dz = randn;

    % 创建平移矩阵
    T = [
      dx;
      dy;
      dz;
        
    ];
end