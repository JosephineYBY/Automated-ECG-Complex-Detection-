function [acc] = test_accuracy(data,filter_type)
%acc is abbreviation for accuracy
acc=zeros(1,5);
j=1;
for i=8:-2:2
    [filtered_data] = filter_data(data,i./2,5,10,1,60,2,2,filter_type);
    [thresh_low,thresh_high] = threshold_calculate(filtered_data,1);
    [AnnTest,heartbeat]=threshold_detect(filtered_data,thresh_low,thresh_high);
    [accuracy] = compare( AnnTest );
    acc(j) = accuracy;
    j=j+1;
end
    plot(acc);
    axis()
    xlabel('bandpass filter order');
    ylabel('Accuracy');
end






