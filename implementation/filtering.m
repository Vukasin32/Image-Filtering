function [new_img] = filtering(input_img, mask)

[M,N] = size(input_img);
dimensions_mask = size(mask); 

K = (dimensions_mask(1,1)-1)/2; % 2*K represents num. of rows and columns 
                                % that need to be added as padding in order
                                % to save dimensionality of input image
                                % after applying filtering function
                                % K is significant for initializing
                                % other variables of filtering function 

matrix = zeros(M+2*K,N+2*K);   % this matrix represents help variable
                               % zero padding is used

matrix(K+1:K+M,K+1:K+N) = input_img; % now variable matrix has input image 
                                     % plus padding 

new_img = zeros(M,N); % variable new_img will be result of filtering function

% start_row and start_column are help variables
% r and c are used for iterating over help variable matrix
% p and q are used for iterating over mask
start_row = K+1;
for i = 1:M                 
    start_column = K+1;    
    for j = 1:N            
        new_pixel = 0;         
        r = start_row-K; 
        for p = 1:dimensions_mask
            c = start_column-K;
            for q = 1:dimensions_mask
                new_pixel = new_pixel + mask(p,q)*matrix(r,c); % filtering
                c = c+1;
            end
            r = r+1;
        end
        new_img(i,j) = new_pixel; % new_pixel is placed in new_img
        start_column = start_column+1;
    end
    start_row = start_row+1;
end
end