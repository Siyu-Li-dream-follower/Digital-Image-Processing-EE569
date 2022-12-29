%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function converted_channel=CMYRGBconvert(input_channel)
[m,n]=size(input_channel);
converted_channel=zeros(m,n);
for i=1:m
    for j=1:n
        converted_channel(i,j)=255-input_channel(i,j);
    end
end

end