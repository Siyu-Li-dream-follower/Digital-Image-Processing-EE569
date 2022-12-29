%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function labelmapfinal=CCL_LabelMap(img)
[m,n]=size(img);
%%%%%%%%%%%% Step 1
labelmap=zeros(m+2,n+2);
label=1;

for i=1:m
    for j=1:n
        if img(i,j)==1
            if labelmap(i,j)==0 && labelmap(i,j+1)==0 && labelmap(i,j+2)==0 && labelmap(i+1,j)==0 %&& labelmap(i+1,j+1)==0
                labelmap(i+1,j+1)=label;
                label=label+1;
            else
                %if labelmap(i,j)==0 && labelmap(i,j+1)==0 && labelmap(i,j+2)==0 && labelmap(i+1,j)==0
                labelsort=[labelmap(i,j),labelmap(i,j+1),labelmap(i,j+2),labelmap(i+1,j)];
                
                for p=1:3
                    for q=1:3-p
                        if labelsort(1,q) > labelsort(1,q+1)
                            
                            temp=labelsort(1,q);
                            labelsort(1,q)=labelsort(1,q+1);
                            labelsort(1,q+1)=temp;
                            
                        end
                    end
                end
                
                k=1;
                while labelsort(1,k)==0
                    if k==4
                        break
                    end
                    k=k+1;
                end
                
                labelmap(i+1,j+1)=labelsort(1,k);
                    
            end
            
        end
        
    end
end
labelmapnew=labelmap;
%%%%%%%%%%%%%%%%%%%%% Step 2
logicvalue=1;
while logicvalue
    labelmapold=labelmapnew;
    
    for i=1:m
        for j=1:n
            if labelmapnew(i+1,j+1) >0
                neighbor_8pix=[labelmapnew(i,j),labelmapnew(i,j+1),labelmapnew(i,j+2),...
                    labelmapnew(i+1,j),labelmapnew(i+1,j+2),labelmapnew(i+2,j),...
                    labelmapnew(i+2,j+1),labelmapnew(i+2,j+2)];
                for p=1:7
                    for q=1:7-p
                        if neighbor_8pix(1,q) > neighbor_8pix(1,q+1)
                            
                            temp=neighbor_8pix(1,q);
                            neighbor_8pix(1,q)=neighbor_8pix(1,q+1);
                            neighbor_8pix(1,q+1)=temp;
                            
                        end
                    end
                end
                k=1;
                while neighbor_8pix(1,k)==0
                    if k==8
                        break
                    end
                    k=k+1;
                end
                
                minimum=neighbor_8pix(1,k);
               
                %minima=min(neighbor_8(neighbor_8>0)); 
                if minimum < labelmapnew(i+1,j+1) && minimum>0 %%% Deal with 8 neighbors all 0 case properly!!!
                    labelmapnew(i+1,j+1)=minimum;
                else
                    labelmapnew(i+1,j+1)=labelmapnew(i+1,j+1);
                end
            end
        end
    end
    
    logicvalue=LoopStopCriteria(labelmapnew,labelmapold);
    
end

labelmapfinal=labelmapnew(2:m+1,2:n+1);

end