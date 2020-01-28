function [AnnTest,heartbeat] = threshold_detect(filtereddata,thresh_low,thresh_high)
L=length(filtereddata);
t=0:690/L:690*(L-1)/L;

%detect heartbeats and store them
beat_count=0;
detect=zeros(1,length(filtereddata));


for i=length(filtereddata)-1:-1:2
  
    if (filtereddata(i)>thresh_high)&&(filtereddata(i)>filtereddata(i+1))&&(filtereddata(i)>filtereddata(i-1))
           detect(i)=1;
           beat_count=beat_count+1;
   
    else
    
    if (thresh_low<filtereddata(i)<thresh_high)&&(filtereddata(i)>filtereddata(i+1))&&(filtereddata(i)>filtereddata(i-1))
            
            detect(i)=1;
            beat_count=beat_count+1;
    end
    end
       

  
end

AnnTest.time=zeros(1,beat_count);
index=1;

for j=1:length(filtereddata)
    if detect(j)==1
        AnnTest.time(index)=t(j);
        index=index+1;
    end
end

AnnTest.unit=ones(1,beat_count);
heartbeat = AnnTest.time;
end

