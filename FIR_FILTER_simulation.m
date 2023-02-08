N = 512;                                      %fft的N 
N1= N-1;
n = 0:N-1;
fs = 25e6;                                     %25M采样率
t=(0:1/fs:N/fs);                               %信号源
fp = 1e6;                                      %2M截止频率
%x00= square(2*pi*0.2e6*t);                       %绘制方波200KHz
%x00= square(2*pi*0.5e6*t);                       %绘制方波500KHz
%x00= square(2*pi*1e6*t);                         %绘制方波1MHz
x00= square(2*pi*2e6*t);                         %绘制方波2MHz
y00 = fft(x00,N);                              %fft
m00 =abs(y00);
x01 = filter(hamming_2_25_25,1,x00);   % 进行滤波,filter表示进行滤波，
                           %第一个lpf表示的是保存的滤波器的形式，第二个1是分母系数，第三个x是要滤波的信号              
figure;
subplot(221);
plot(t(1:200),x00(1:200));
xlabel('时间/s'),ylabel('幅值');
title('方波2MHz窗函数滤波前时域');
subplot(222);
plot(f(1:N/2)/1e6,m00(1:N/2));                %输出滤波前的频谱
xlabel('频率/MHz'),ylabel('幅值');
title('方波2MHz窗函数滤波前频谱');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(223);
plot(t(1:200),x01(1:200));
xlabel('时间/s'),ylabel('幅值');
title('方波2MHz窗函数滤波后时域');
subplot(224);
y01 = fft(x01,N);
m01 =abs(y01);
plot(f(1:N/2)/1e6,m01(1:N/2)); %输出滤波后的频谱
xlabel('频率/MHz'),ylabel('幅值');
title('方波2MHz窗函数滤波后频谱');





Wn=fp/fs*2;
[H1,w1] = freqz(hamming_2_25_25,1,512);     %分析频响
figure();
plot(w1/pi,abs(H1),...                  %绘制实际幅频响应
     [0 Wn Wn 1],[1 1 0 0],'r');        %期望幅频响应    
xlabel('Normalized Frequency  (\times\pi rad/sample)')
ylabel('Magnitude')
axis([0 1 -0.2 1.2]);
legend('LPF幅频响应','期望幅频响应');
title('FREQUENCY DOMAIN')


