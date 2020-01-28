function [thresh_low,thresh_high] = threshold_calculate(filtered_data,threshold_choose)
switch threshold_choose
    
    case 1
        %set higher threshold equal to the min of max 390000 filtered data
        %set lower threshold equal to the max of min 10000 filtered data
        thresh_high=min(maxk(filtered_data,390000));
        thresh_low=max(mink(filtered_data,10000));
        
    case 2
        %set higher threshold equal to the min of max 331200=690000*0.48 filtered data
        %set lower threshold equal to the max of min 34500=690000*0.05 filtered data
        thresh_high=min(maxk(filtered_data,331200));
        thresh_low=max(mink(filtered_data,34500));
    
   
end


 

end

