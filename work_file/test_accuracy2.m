function [acc] = test_accuracy2(data,order,filter_type)
acc=zeros(20,29);
for i=1:1:20
for j=50:-1:21
    
 [filtered_data] = filter_data(data,order,i,j,1,60,2,2,filter_type);
    [thresh_low,thresh_high] = threshold_calculate(filtered_data,1);
    [AnnTest,heartbeat]=threshold_detect(filtered_data,thresh_low,thresh_high);
    [accuracy] = compare( AnnTest );
    acc(i,j) = accuracy;
end
surf(acc);
colormap(jet);
ylabel('low   frequency');
xlabel('high  frequency');
zlabel('Accuracy');
end

