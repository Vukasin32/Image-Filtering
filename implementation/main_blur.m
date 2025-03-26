clear
close all
clc

%% Reading image and displaying 
img = imread('images/shapes_blur.jpg');
if length(size(img)) == 3
    img = rgb2gray(img);  % if input image is RGB convert it to grayscale
end

figure()
imshow(img) 
title('Input image')

%% Both types of filtering - results
h1_a = (1/3/3)*ones(3,3);       
h2 = 1/16*[1 2 1; 2 4 2 ; 1 2 1]; 

new_img_h1_a = filtering(img,h1_a); % first mask
new_img_h2 = filtering(img,h2); % second mask

figure()
subplot(1,3,1)
imshow((img))
title('Input')
subplot(1,3,2)
imshow(uint8(new_img_h1_a))
title('First mask')
subplot(1,3,3)
imshow(uint8(new_img_h2))
title('Second mask')
sgtitle('Input image vs first vs second mask')

%% Versions of first mask
h1_b = (1/9/9)*ones(9,9);      % second version of first mask
h1_c = (1/35/35)*ones(35,35);  % third version of first mask

new_img_h1_b = filtering(img,h1_b);  
new_img_h1_c = filtering(img,h1_c);

figure()         
subplot(1,4,1)  
imshow((img))
title('Input')
subplot(1,4,2)
imshow(uint8(new_img_h1_a))
title('3x3')
subplot(1,4,3)
imshow(uint8(new_img_h1_b))
title('9x9')
subplot(1,4,4)
imshow(uint8(new_img_h1_c))
title('35x35')
sgtitle('Input image vs three versions of first mask')

%% Best version of first mask 
% experimenting with dim of first mask, it is shown that 
% the best version of first mask is h1_best, dim is 5x5

h1_best = (1/5/5)*ones(5,5);
new_img_h1_best = filtering(img,h1_best);

figure()        
subplot(1,2,1)  
imshow(img)
title('Input')
subplot(1,2,2)
imshow(uint8(new_img_h1_best))
title('5x5')
sgtitle('Input image vs best version of first mask') 