function [filtered_data] = filter_data(data,order,freq_low,freq_high,Rp,Rs,order_lowpass,cutoff_freq,filter_type)
%detect R waves and store data into AnnTest
L=length(data);
Fs=L/690;  %sampling frequency
Fn=Fs/2;   %Nyquist Frequency


switch filter_type %design three types of filter
    
    case 1
       [b,a]=butter(order,[freq_low freq_high]/Fn,'bandpass');
       test=filtfilt(b,a,data);
      % subplot(3,1,1);
      % plot(test(1:40000));
      % xlabel('time(ms)');
      % ylabel('ECG magnitude');
      % title('Bandpass filtered data, first 40 seconds');
       
    case 2
       [b,a]=cheby2(order,Rp,[freq_low freq_high]/Fn);
       test=filtfilt(b,a,data);
      % subplot(3,1,1);
      % plot(test(1:40000));
      % xlabel('time(ms)');
      % ylabel('ECG magnitude');
      % title('Bandpass cheby2 filtered data, first 40 seconds');
       
       
    case 3
        [b,a] = ellip(order,Rp,Rs,[freq_low freq_high]/Fn);
        test=filtfilt(b,a,data);
       % subplot(3,1,1);
       % plot(test(1:40000));
       % xlabel('time(ms)');
       % ylabel('ECG magnitude');
       % title('Bandpass ellip filtered data, first 40 seconds');
       
        
end
%squaring filtered data
data_squared=test.^2;
%subplot(3,1,2);
%plot(data_squared(1:40000));
%xlabel('time(ms)');
%ylabel('ECG magnitude');
%title('squared data');
%lowpass filter
[c,d]=butter(order_lowpass,cutoff_freq/Fn);
newdata=filtfilt(c,d,data_squared);
newdata1=newdata./max(data_squared); %normalize newdata magnitude
%subplot(3,1,3);
%plot(newdata(1:40000));
%xlabel('time(ms)');
%ylabel('ECG magnitude');
%title('Lowpass filtered data');
filtered_data=newdata1;
%fvtool(b,a);
end

