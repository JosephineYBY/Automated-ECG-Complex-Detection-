clear;
data=tread_wfdb('mit_sample.dat');
L=length(data);
t=0:690/L:690*(L-1)/L;
[filtered_data]= filter_data(data,4,5,10,1,60,2,2,1);
[thresh_low,thresh_high] = threshold_calculate(filtered_data,1);
[AnnTest,heartbeat]=threshold_detect(filtered_data,thresh_low,thresh_high);
[accuracy] = compare( AnnTest );
