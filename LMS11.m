%function main()
close  all

% 周期信号的产生 
t=0:99;
xs=10*sin(0.5*t);
figure;
subplot(2,1,1);
plot(t,xs);grid;
ylabel('幅值');
title('it{输入周期性信号}');

% 噪声信号的产生
randn('state',sum(100*clock));
xn=randn(1,100);
subplot(2,1,2);
plot(t,xn);grid;
ylabel('幅值');
xlabel('时间');
title('it{随机噪声信号}');

% 信号滤波
xn = xs+xn;
xn = xn.' ;   % 输入信号序列
dn = xs.' ;   % 预期结果序列
M  = 20   ;   % 滤波器的阶数

rho_max = max(eig(xn*xn.'));   % 输入信号相关矩阵的最大特征值
mu = rand()*(1/rho_max)   ;    % 收敛因子 0 < mu < 1/rho

[yn,W,en] = LMS1(xn,dn,M,mu);

% 绘制滤波器输入信号
figure;
subplot(2,1,1);
plot(t,xn);grid;
ylabel('幅值');
xlabel('时间');
title('it{滤波器输入信号}');

% 绘制自适应滤波器输出信号
subplot(2,1,2);
plot(t,yn);grid;
ylabel('幅值');
xlabel('时间');
title('it{自适应滤波器输出信号}');

% 绘制自适应滤波器输出信号,预期输出信号和两者的误差
figure 
plot(t,yn,'b',t,dn,'g',t,dn-yn,'r');grid;
legend('自适应滤波器输出','预期输出','误差');
ylabel('幅值');
xlabel('时间');
title('it{自适应滤波器}');