%  该程序实现时域LMS算法，并用统计的方法仿真得出不同步长下的收敛曲线
clear                             %   清空变量空间
g=100;                          %   统计仿真次数为g
N=1024;                        %   输入信号抽样点数N
k=128;                          %   时域抽头LMS算法滤波器阶数
pp=zeros(g,N-k);                 %   将每次独立循环的误差结果存于矩阵pp中，以便后
                               %   面对其平均
u=0.001;                        %   收敛因子
for q=1:g                
t=1:N;
    a=1;
    s=a*sin(0.5*pi*t);            %   输入单频信号s
    figure(1);
    plot(t,real(s));                %   信号s时域波形
    title('信号s时域波形');
    xlabel('n');
    ylabel('s');
    axis([0,N,-a-1,a+1]);
    xn=awgn(s,3);               %   加入均值为零的高斯白噪声，信噪比为3dB   
    % 设置初值
    y=zeros(1,N);                %    输出信号y
    y(1:k)=xn(1:k);              %   将输入信号xn的前k个值作为输出y的前k个值
    w=zeros(1,k);                %    设置抽头加权初值
    e=zeros(1,N);                %    误差信号
    % 用LMS算法迭代滤波
    for i=(k+1):N
               XN=xn((i-k+1):(i)); 
               y(i)=w*XN';
               e(i)=s(i)-y(i);
               w=w+u*e(i)*XN;   
     end
     pp(q,:)=(e(k+1:N)).^2;  
  end
  for b=1:N-k
         bi(b)=sum(pp(:,b))/g;     %   求误差的统计平均
  end
  figure(2);                    %   算法收敛曲线
  t=1:N-k;
  plot(t,bi);
  hold off                     %   将每次循环的图形显示结果保存下来