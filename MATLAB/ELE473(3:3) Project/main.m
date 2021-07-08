[n p]=uigetfile;  %%for opening open window and asking the path and name of image
imgt=imread([p n]); %% image reading
if size(imgt,3)~=1 %% if image is colored    
    
    img=rgb2gray(imgt);% changing colored image to grayscale
else
    img=imgt;
end

imgb=img<100;%% thresholding
CC=bwconncomp(imgb);%% Connected components finding
STATS = regionprops(CC);%% extracted the properties of images
idx = find([STATS.Area] > 3 & [STATS.Area] < 50 ); % finding area between 3 and 30
BW2 = ismember(labelmatrix(CC), idx);%% out image 
subplot(2,2,1)
imshow(BW2)%% ploting
title('Reconstruted pic with global thresholding')% title
subplot(2,2,2)% ploting
if size(imgt,3)~=1% for colored
    imgo=imgt;
    [a b]=find(BW2==1);
    for ii=1:length(a)
    imgo(a(ii),b(ii),1)=255;
    end %% for out image formation with roots with red color
else%% for  grayscale
    imgo(:,:,1)=imgt;
    imgo(:,:,2)=imgt;
    imgo(:,:,3)=imgt;
    [a b]=find(BW2==1);
    for ii=1:length(a)
    imgo(a(ii),b(ii),1)=255;
    end %% for out image formation with roots with red color
end
imshow(imgo);
title('Reconstruted pic with global thresholding')


[r c]=size(img);
m=20;%% grid size
tr=fix(r/m);
tc=fix(c/m);%% the number of grids
imgb=zeros((tr.*m),tc.*m);%% initial image formation
for ii=1:tr
    for jj=1:tc
        e=img(m*(ii-1)+1:m*(ii),m*(jj-1)+1:m*(jj));%% for each grid
        T=e<0.8.*mean(mean(e));%% thresholding
        imgb(m*(ii-1)+1:m*(ii),m*(jj-1)+1:m*(jj))=T;
        
    end
end
CC=bwconncomp(imgb);%% Connected components finding
STATS = regionprops(CC);%% extracted the properties of images
idx = find([STATS.Area] > 3 & [STATS.Area] < 50 ); % finding area between 3 and 30
BW2 = ismember(labelmatrix(CC), idx);%% out image 
subplot(2,2,3)
imshow(BW2)%% ploting
title('Reconstruted pic with local thresholding')% title
subplot(2,2,4)% ploting
if size(imgt,3)~=1% for colored
    imgo=imgt;
    [a b]=find(BW2==1);
    for ii=1:length(a)
    imgo(a(ii),b(ii),1)=255;
    end %% for out image formation with roots with red color
else%% for  grayscale
    imgo(:,:,1)=imgt;
    imgo(:,:,2)=imgt;
    imgo(:,:,3)=imgt;
    [a b]=find(BW2==1);
    for ii=1:length(a)
    imgo(a(ii),b(ii),1)=255;
    end %% for out image formation with roots with red color
end
imshow(imgo);
title('Reconstruted pic with local thresholding')
