clear
close all
clc

%% Reading image and displaying 
img = imread('images/buildings_edges.jpg');
if length(size(img)) == 3
    img = rgb2gray(img);  % if input image is RGB convert it to grayscale
end

figure()
imshow(img) 
title('Input image')

%% Both types of filtering - results
h1 = [1 2 1; 0 0 0; -1 -2 -1];     % vertical edges mask 
h2 = [-1 0 1; -2 0 2; -1 0 1];     % horizontal edges mask 

new_img_h1 = filtering(img,h1); % first mask
new_img_h2 = filtering(img,h2); % second mask

figure()
subplot(1,3,1)
imshow((img))
title('Input')
subplot(1,3,2)
imshow(uint8(new_img_h1))
title('Vertical edges')
subplot(1,3,3)
imshow(uint8(new_img_h2))
title('Horizontal edges')
sgtitle('Input image vs first vs second mask')