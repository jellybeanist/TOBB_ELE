% Burak Can KARAKURT - 161201049 
% ELE101 Odev 4

%% Coding Part:
% Adding the image will be processed to the workspace
image = imread('resim1.png');
%size(image); %256x256x3

% Convert RGB image to grayscale, threshold value selected randomly and in
% this project there will be only 2 colours so it will not change our
% output. bw is our black & white image.
grayscale=rgb2gray(image);
bw = grayscale < 70;
%size(bw); %256x256

% regionprops is MATLAB Built-in function. It returns measurements for the 
% set of properties for each 8-connected component (object) in the binary 
% image, bw.
% Check references for further information.
stats = regionprops('table',bw,'Centroid','Extrema');

%Extrema points in the region, returned as an 8-by-2 matrix. 
%Each row of the matrix contains the x- and y-coordinates of one of the points. 
%The format of the vector is:
%[top-left top-right right-top right-bottom bottom-right bottom-left left-bottom left-top]. 
extrema=stats.Extrema;

% Create an array to use extrema values later.
array=zeros(8,2);
array=extrema{1};

% The coordinates are (Xtop left, Ytop left, Xbottom right, Ybottom right).
% Which equals to (array(1,1)), (array(1,2)), (array(4,1)), (array(4,2)).

% Calculating height and weight to divide our rectangle into 4 parts.
yukseklik=floor(array(6,2)-array(1,2));
uzunluk=floor(array(2,1)-array(1,1));
bw1 = grayscale > 120;
% Cropping the image 
b = imcrop(bw1,[ceil(array(1,1)), ceil(array(1,2)), floor(array(4,1)), floor(array(4,2))]);
% Centralizing the image.
b2=imcrop(b,[0,0,uzunluk,yukseklik]);
%size(b2); %41x41

% Converting grayscale image to RGB. 
grayImage = 255 * uint8(b2);
RGB = cat(3, grayImage, grayImage, grayImage);
%size(RGB); %41x41x3

% Upper half of the Y axis, first half of the X axis will be yellow
% and second half of the X axis will be red.
for x=1:ceil(uzunluk/2)
    for y=1:yukseklik
        if (y<ceil(yukseklik/2))
        RGB(x, y, :) = [255, 255, 0]; %RGB value of the colour yellow
        else
        RGB(x, y, :) = [255, 0, 0]; %RGB value of the colour red
        end
    end
end

% Lower half of the Y axis, first half of the X axis will be blue
% and second half of the X axis will be green.
for x=ceil(uzunluk/2):uzunluk
    for y=1:uzunluk
        if (y<ceil(uzunluk/2))
        RGB(x, y, :) = [0, 0, 255]; %RGB value of the colour blue
        else
        RGB(x, y, :) = [0, 255, 0]; %RGB value of the colour green
        end
    end
end

% Putting a small white rectangle to the center of the processed image.
for x=ceil(uzunluk/4):3*(uzunluk)/4
    for y=ceil(yukseklik/4):3*(yukseklik)/4
        RGB(x, y, :) = [255, 255, 255]; %RGB value of the colour white
    end
end

%% Output Part
subplot(1,4,1)
imshow(image)
title('Original Image')
subplot(1,4,2)
imshow(bw1)
title('Grayscale Image')
subplot(1,4,3)
imshow(b2)
title('Cropped Image')
subplot(1,4,4)
imshow(RGB)
title('Final Image')


%% References:
% 1) https://www.elektrikport.com/teknik-kutuphane/matlab-ile-goruntu-isleme-uygulamasi-elektrikport-akademi/8434#ad-image-0

%2) https://www.mathworks.com/help/images/ref/regionprops.html

%3) https://muratdelen.com/resim-isleme

%4) https://www.mathworks.com/help/images/ref/imcrop.html

%5) https://www.mathworks.com/matlabcentral/answers/323129-calculate-each-object-maximum-height-and-weight

%6) https://www.mathworks.com/help/fixedpoint/ref/ceil.html

%7) https://www.mathworks.com/help/images/ref/im2bw.html

%8) https://www.mathworks.com/matlabcentral/answers/134746-convert-binary-image-to-rgb-image
