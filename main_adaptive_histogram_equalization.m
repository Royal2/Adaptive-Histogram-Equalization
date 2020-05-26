% Perform AHE and HE on image 'beach.png'
clear all; close all; clc;
image=imread('beach.png');
image_win33=AHE(image, 33);
image_win65=AHE(image, 65);
image_win129=AHE(image, 129);

image_HE=histeq(image);

figure; imshow(image); title('Original image');
figure; imshow(mat2gray(image_win33)); title('Image after AHE, win size = 33');
figure; imshow(mat2gray(image_win65)); title('Image after AHE, win size = 65');
figure; imshow(mat2gray(image_win129)); title('Image after AHE, win size = 129');
figure; imshow(image_HE); title('Image after simple HE');

%Make sure to resize all images to ensure they do not take up too much space

%%
close all; clear all; clc;
image=imread('beach.png');
%image_gray=mat2gray(image);
image_win33=AHE(mat2gray(image), 33);
figure; imshow(image); title('Original image');
figure; imshow(image_win33); title('Image after AHE, win size = 33');
figure; histogram(image); title('Original image');
figure; histogram(image_win33); title('Image after AHE, win size = 33');

figure;
cmap = gray(256);
cmap(9,:) = [1,0,0];
colormap(cmap);
imagesc(image_win33),colormap(cmap)