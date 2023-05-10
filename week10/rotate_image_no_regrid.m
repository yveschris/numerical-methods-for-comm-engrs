function im_2 = rotate_image_no_regrid(im, angle)

    % Rotates matrix or grayscale image im counter-clockwise by angle
    % specified by angle. The output image will have the same dimensions
    % as the input image, so some of the original image's data may be cut
    % off upon rotation. The output image will be properly centered. Any 
    % extraneous data points that arise from rotations will be NaN-valued.
    %
    % Writing this function to preserve the original dimensions of the 
    % input image while properly centering the output image proved to be a 
    % conundrum, and after some pondering I have concluded that if the 
    % output image is always to be properly centered then there will
    % sometimes be circumstances under which the addition of artificial 
    % data is necessary. This function adds artificial data only when 
    % necessary. See Example 2 for a clearer demonstration of this, and 
    % please note that for any reasonably-sized image this effect will be 
    % virtually unnoticeable. Example 2 is an intentially discreet case 
    % designed to more easily visualize this idea.
    %
    % This function calls rotate_image_regrid on im. It then takes the 
    % output from that function and attempts to center a frame of the 
    % original dimensions of im around it. If the centering of this frame  
    % is problematic due to a discrepancy in the parity of the dimensions 
    % of im and the image returned by rotate_image_regrid, then artificial 
    % data will be added to make proper centering possible.
    %
    % Please feel free to suggest ways to improve this function or modify
    % it yourself. Just provide credit if you do so.
    %
    %
    % Example 1:
    
    %     % Rotate the image 'coins.png' by increments of 10 degrees from 0 to 180
    %     % degrees, counterclockwise. The dimensions of the image remain consistent as it is rotated
    %     % about its center, hence some of the image gets cut off when rotated.
    % 
    %     im_1 = imread('coins.png');
    %     for t = 0:10:180
    %         im_2 = uint8(rotate_image_no_regrid(im_1,t));
    %         figure, imshow(im_2);
    %     end
    %
    %
    % Example 2: 
    %
    %     % This example is intended to test how the code functions at a very
    %     % discrete level. The matrix test_mat is rotated counter-clockwise in
    %     % increments of 10 degrees from 0 to 180 degrees. Its dimensions remain
    %     % consistent, and the data remains properly centered. Note that in some
    %     % cases, an extra row or column of data is added to ensure that the data
    %     % remains properly centered. For example, the original data has a tan bar
    %     % running through its center row - this is the 3rd row, since the matrix
    %     % has 5 rows. However, at the 90 degree position, when this bar becomes
    %     % entirely vertical, it would be impossible to center it as a singular 
    %     % column because the matrix has an even number of columns (8). Therefore,
    %     % a second column is added so that both the 4th and 5th columns % display
    %     % the tan bar and the image is properly centered. On the other hand, if the
    %     % original matrix had 9 columns, a 90-degree rotation would not be
    %     % problematic because the parity of columns and rows would be equivalent (5
    %     % and 9 are both odd numbers).
    % 
    %     test_mat = zeros(5,8);
    %     test_mat(1,1) = 1;
    %     test_mat(2,1) = 1;
    %     test_mat(4,1) = 2;
    %     test_mat(2,8) = 1;
    %     test_mat(4,8) = 2;
    %     test_mat(1,8) = 1;
    %     test_mat(5,1) = 2;
    %     test_mat(5,8) = 2;
    %     test_mat(3,:) = 3;
    %     test_mat(1,2:7) = 4;
    %     test_mat(5,2:7) = 4;
    % 
    %     for t = 0:10:180
    %         test_mat_2 = rotate_image_no_regrid(test_mat,t);
    %         figure, imagesc(test_mat_2);
    %     end
    %
    %
    % Functions required for use: rotate_image_regrid
    %
    % Evan Czako, 8.29.2019
    % -------------------------------------------
    
    
    
    
    a = im;
    a2 = rotate_image_regrid(a,angle);
    a3 = a2;
    a4 = nan(size(a));

    if mod(size(a,2),2) ~= mod(size(a3,2),2)
        a3 = [a3(:,1:ceil(size(a3,2)/2)-1) a3(:,ceil(size(a3,2)/2)) a3(:,ceil(size(a3,2)/2):size(a3,2))];
    end

    if mod(size(a,1),2) ~= mod(size(a3,1),2)
        a3 = [a3(1:ceil(size(a3,1)/2)-1,:) ; a3(ceil(size(a3,1)/2),:) ; a3(ceil(size(a3,1)/2):size(a3,1),:)];
    end

    ind1 = size(a4,1)/2-min(size(a3,1)/2,size(a4,1)/2)+1;
    ind2 = ind1+min(size(a3,1)-1,size(a4,1)-1);
    if size(a3,1) <= size(a4,1)
        ind3 = 1;
        ind4 = size(a3,1);
    else
        ind3 = abs(size(a3,1)-size(a4,1))/2+1;
        ind4 = ind3 + size(a4,1)-1;
    end

    ind5 = size(a4,2)/2-min(size(a3,2)/2,size(a4,2)/2)+1;
    ind6 = ind5+min(size(a3,2)-1,size(a4,2)-1);
    if size(a3,2) <= size(a4,2)
        ind7 = 1;
        ind8 = size(a3,2);
    else
        ind7 = abs(size(a3,2)-size(a4,2))/2+1;
        ind8 = ind7 + size(a4,2)-1;
    end

    a4(ind1:ind2,ind5:ind6) = a3(ind3:ind4,ind7:ind8);
    im_2 = a4;
end