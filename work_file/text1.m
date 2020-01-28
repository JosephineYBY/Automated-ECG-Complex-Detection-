%load data
clear all;
data=tread_wfdb('mit_sample.dat');
L=length(data);
Fs=L/690;  %sampling frequency
t=0:690/L:690*(L-1)/L;
figure(1);
subplot(2,1,1);
plot(data);
title('origial signal');

%design a filter
%duration 690s
Fn=Fs/2;   %Nyquist Frequency
Wp=[5 15]/Fn; %Filter bandpass
[b,a]=butter(4,Wp,'bandpass');
test1=filtfilt(b,a,data);
detect_square=test1.^2;
subplot(2,1,2),
plot(test1);
title('bandpass filter');
fvtool(b,a);


%detection of R wave
A=max(detect_square);
B=min(detect_square);
T=((A+B)./2+A)./5;%threshold value
beat_count=0;

for i=2:length(detect_square)-1
 %when the frequency greater than threshold and this frequency is greater than
 %adjacent heartbeat, marking this one a heartbeat, which values one.
      if (detect_square(i)-T>0)&(detect_square(i)-detect_square(i+1)>0)&(detect_square(i)-detect_square(i-1)>0)
          
             detect_square(i)=1; 
             
             beat_count=beat_count+1;
         
      end 
end

k=find(detect_square==1);
plot(L,test1,k,1);
    







