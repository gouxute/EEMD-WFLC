 clear;
 close all;
 clc;
%u = 0.00001;
%tsize = 5000;
%--------------
%j
% u = 0.000001;
% N = 3;
% tsize = 60000;
%load('test_ecg_emd1.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------------
% Select dataset (comment in/out)
% 
% filePath = 'Datasets/straightLine';
% startTime = 6;
% stopTime = 26;

filePath = 'Gait Tracking With x-IMU/Datasets/stairsAndCorridor';
startTime = 5;
stopTime = 53;

% filePath = 'Datasets/spiralStairs';
% startTime = 4;
% stopTime = 47;

% -------------------------------------------------------------------------
% Import data


samplePeriod = 1/256;
xIMUdata = xIMUdataClass(filePath, 'InertialMagneticSampleRate', 1/samplePeriod);
time = xIMUdata.CalInertialAndMagneticData.Time;
gyrX = xIMUdata.CalInertialAndMagneticData.Gyroscope.X;
gyrY = xIMUdata.CalInertialAndMagneticData.Gyroscope.Y;
gyrZ = xIMUdata.CalInertialAndMagneticData.Gyroscope.Z;
accX = xIMUdata.CalInertialAndMagneticData.Accelerometer.X;
accY = xIMUdata.CalInertialAndMagneticData.Accelerometer.Y;
accZ = xIMUdata.CalInertialAndMagneticData.Accelerometer.Z;
clear('xIMUdata');
% -------------------------------------------------------------------------
% Manually frame data

% startTime = 0;
% stopTime = 10;

indexSel = find(sign(time-startTime)+1, 1) : find(sign(time-stopTime)+1, 1);
time = time(indexSel);
gyrX = gyrX(indexSel, :);
gyrY = gyrY(indexSel, :);
gyrZ = gyrZ(indexSel, :);
accX = accX(indexSel, :);
accY = accY(indexSel, :);
accZ = accZ(indexSel, :);

% -------------------------------------------------------------------------
% Detect stationary periods

% Compute accelerometer magnitude
acc_mag = sqrt(accX.*accX + accY.*accY + accZ.*accZ);

% HP filter accelerometer data
filtCutOff = 0.001;
[b, a] = butter(1, (2*filtCutOff)/(1/samplePeriod), 'high');
acc_magFilt = filtfilt(b, a, acc_mag);

% Compute absolute value
acc_magFilt = abs(acc_magFilt);

% LP filter accelerometer data
filtCutOff = 5;
[b, a] = butter(1, (2*filtCutOff)/(1/samplePeriod), 'low');
acc_magFilt = filtfilt(b, a, acc_magFilt);

% Threshold detection
stationary = acc_magFilt < 0.05;

% -------------------------------------------------------------------------
% Compute orientation

quat = zeros(length(time), 4);
AHRSalgorithm = AHRS('SamplePeriod', 1/256, 'Kp', 1, 'KpInit', 1);

% Initial convergence
initPeriod = 2;
indexSel = 1 : find(sign(time-(time(1)+initPeriod))+1, 1);
for i = 1:2000
    AHRSalgorithm.UpdateIMU([0 0 0], [mean(accX(indexSel)) mean(accY(indexSel)) mean(accZ(indexSel))]);
end

% For all data
for t = 1:length(time)
    if(stationary(t))
        AHRSalgorithm.Kp = 0.5;
    else
        AHRSalgorithm.Kp = 0;
    end
    AHRSalgorithm.UpdateIMU(deg2rad([gyrX(t) gyrY(t) gyrZ(t)]), [accX(t) accY(t) accZ(t)]);
    quat(t,:) = AHRSalgorithm.Quaternion;
end

% -------------------------------------------------------------------------
% Compute translational accelerations

% Rotate body accelerations to Earth frame
acc = quaternRotate([accX accY accZ], quaternConj(quat));

% % Remove gravity from measurements
% acc = acc - [zeros(length(time), 2) ones(length(time), 1)];     % unnecessary due to velocity integral drift compensation

% Convert acceleration measurements to m/s/s
acc = acc * 9.81;

% Plot translational accelerations
figure('Position', [9 39 900 300], 'Number', 'off', 'Name', 'Accelerations');
hold on;
plot(time, acc(:,1), 'r');
plot(time, acc(:,2), 'g');
plot(time, acc(:,3), 'b');
title('Acceleration');
xlabel('Time (s)');
ylabel('Acceleration (m/s/s)');
legend('X', 'Y', 'Z');
hold off;

% -------------------------------------------------------------------------
% Compute translational velocities

acc(:,3) = acc(:,3) - 9.81;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T0 = 10;
ecg1 = acc(:,2);
fN = 3;
ecg1 = medfilt1(ecg1,fN);
ecg = zoom(ecg1',T0);
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[modes its]=ceemdan(ecg,0.2,500,5000);


zz=linspace(0,T0,100);
yy=spline(1:T0,ecg,zz);
plot(yy)
figure(2);
plot(ecg);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=1:length(ecg);

[a b]=size(modes);

figure;
subplot(a+1,1,1);
plot(t,ecg);% the ECG signal is in the first row of the subplot
ylabel('ECG')
set(gca,'xtick',[])
axis tight;

for i=2:a
    subplot(a+1,1,i);
    plot(1:b,modes(i-1,:));
    ylabel (['IMF ' num2str(i-1)]);
    set(gca,'xtick',[])
    xlim([1 b])
end;

subplot(a+1,1,a+1)
plot(1:b,modes(a,:))
ylabel(['IMF ' num2str(a)])
xlim([1 b])

figure;
boxplot(its);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

