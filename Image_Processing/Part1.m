img = imread('./Assignment1.jpeg'); %read the image
%%Grayscale and saved
%imshow(img);
gray = rgb2gray(img);
gray_size = size(gray);
%imshow(gray)
%%for iso-preference curve
x=[64 80 96 112 128 160 256 ] ;
y=[6.55 6.5 5.6 5.3 5 4.5 4 ];
plot(x,y,'r')
ylabel('K');
xlabel('N');
%--interpolation
row = size(img, 1);
column = size(img, 2);
linear = imresize(gray,[row*2 column*2],'nearest');
%imshow(linear)
% Bilinear Interpolation
% (c,r) = (0,0)
c=0;
r=0;
bil_int1 = zeros(2*size(image_gray,1)-1, 2*size(image_gray,2)-1, "uint8");
for i = 1:size(image_gray,1)
for j = 1:size(image_gray,2)
bil_int1(2*i-1,2*j-1) = image_gray(i,j);
end
end
% Interpolating rows
for i = 1:size(bil_int1,1)
for j = 1:size(bil_int1,2)
if mod(i,2) == 0
if mod(j,2)==1
bil_int1(i,j) = (1-r)*bil_int1(i-1,j) + r*bil_int1(i+1,j);
end
end
end
end
% Interpolating cols
for i = 1:size(bil_int1,1)
for j = 1:size(bil_int1,2)
if mod(j,2) == 0
bil_int1(i,j) = (1-c)*bil_int1(i,j-1) + c*bil_int1(i,j+1);
end
end
end
% (c,r) = (0.25,0.25)
c=0.25;
r=0.25;
bil_int2 = zeros(2*size(image_gray,1)-1, 2*size(image_gray,2)-1, "uint8");
for i = 1:size(image_gray,1)
for j = 1:size(image_gray,2)
bil_int2(2*i-1,2*j-1) = image_gray(i,j);
end
end
% Interpolating rows
for i = 1:size(bil_int2,1)
for j = 1:size(bil_int2,2)
if mod(i,2) == 0
if mod(j,2)==1
bil_int2(i,j) = (1-r)*bil_int2(i-1,j) + r*bil_int2(i+1,j);
end
end
end
end
% Interpolating cols
for i = 1:size(bil_int2,1)
for j = 1:size(bil_int2,2)
if mod(j,2) == 0
bil_int2(i,j) = (1-c)*bil_int2(i,j-1) + c*bil_int2(i,j+1);
end
end
end
% (c,r) = (0.5,0.5)
c=0.5;
r=0.5;
bil_int3 = zeros(2*size(image_gray,1)-1, 2*size(image_gray,2)-1, "uint8");
for i = 1:size(image_gray,1)
for j = 1:size(image_gray,2)
bil_int3(2*i-1,2*j-1) = image_gray(i,j);
end
end
% Interpolating rows
for i = 1:size(bil_int3,1)
for j = 1:size(bil_int3,2)
if mod(i,2) == 0
if mod(j,2)==1
bil_int3(i,j) = (1-r)*bil_int3(i-1,j) + r*bil_int3(i+1,j);
end
end
end
end
% Interpolating cols
for i = 1:size(bil_int3,1)
for j = 1:size(bil_int3,2)
if mod(j,2) == 0
bil_int3(i,j) = (1-c)*bil_int3(i,j-1) + c*bil_int3(i,j+1);
end
end
end
% (c,r) = (0.75,0.75)
c=0.75;
r=0.75;
bil_int4 = zeros(2*size(image_gray,1)-1, 2*size(image_gray,2)-1, "uint8");
for i = 1:size(image_gray,1)
for j = 1:size(image_gray,2)
bil_int4(2*i-1,2*j-1) = image_gray(i,j);
end
end
% Interpolating rows
for i = 1:size(bil_int4,1)
for j = 1:size(bil_int4,2)
if mod(i,2) == 0
if mod(j,2)==1
bil_int4(i,j) = (1-r)*bil_int4(i-1,j) + r*bil_int4(i+1,j);
end
end
end
end
% Interpolating cols
for i = 1:size(bil_int4,1)
for j = 1:size(bil_int4,2)
if mod(j,2) == 0
bil_int4(i,j) = (1-c)*bil_int4(i,j-1) + c*bil_int4(i,j+1);
end
end
end
% (c,r) = (1,1)
c=1;
r=1;
bil_int5 = zeros(2*size(image_gray,1)-1, 2*size(image_gray,2)-1, "uint8");
for i = 1:size(image_gray,1)
for j = 1:size(image_gray,2)
bil_int5(2*i-1,2*j-1) = image_gray(i,j);
end
end
% Interpolating rows
for i = 1:size(bil_int5,1)
for j = 1:size(bil_int5,2)
if mod(i,2) == 0
if mod(j,2)==1
bil_int5(i,j) = (1-r)*bil_int5(i-1,j) + r*bil_int5(i+1,j);
end
end
end
end
% Interpolating cols
for i = 1:size(bil_int5,1)
for j = 1:size(bil_int5,2)
if mod(j,2) == 0
bil_int5(i,j) = (1-c)*bil_int5(i,j-1) + c*bil_int5(i,j+1);
end
end
end
figure(3)
subplot(1,5,1)
imshow(bil_int1)
title("Bilinear Interpolation,(c,r) = (0,0)")
subplot(1,5,2)
imshow(bil_int2)
title("Bilinear Interpolation,(c,r) = (0.25,0.25)")
subplot(1,5,3)
imshow(bil_int3)
title("Bilinear Interpolation,(c,r) = (0.5,0.5)")
subplot(1,5,4)
imshow(bil_int4)
title("Bilinear Interpolation,(c,r) = (0.75,0.75)")
subplot(1,5,5)
imshow(bil_int5)
title("Bilinear Interpolation,(c,r) = (1,1)")

%--binary and then rotated
binary = zeros(gray_size(1), gray_size(2));
for i= 1:gray_size(1)
    for j= 1: gray_size(2)
        if(gray(i,j) > 130)
            binary(i,j) = 1;
        else
            binary(i,j) = 0;
        end
        
    end
end
final = imrotate(binary, 10);
%imshow(final);


