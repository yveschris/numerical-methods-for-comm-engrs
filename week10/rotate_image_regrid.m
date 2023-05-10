function im_2 = rotate_image_regrid(im, angle)

    % Rotates matrix or grayscale image im counter-clockwise by angle
    % specified by angle. The output image will have whatever dimensions
    % are necessary to accommodate the data from the original image at the
    % new angle. Any extraneous data points that appear from rotations
    % other than 0/90/180/270/360/etc degrees will be NaN-valued.
    %
    % Example 1:
    %
    %     % Rotate the image 'coins.png' by increments of 10 degrees from 0 to 180
    %     % degrees, counterclockwise. The dimensions of the image are modified to 
    %     % accommodate all data from the original image.
    % 
    %     im_1 = imread('coins.png');
    %     for t = 0:10:180
    %         im_2 = uint8(rotate_image_regrid(im_1,t));
    %         figure, imshow(im_2);
    %     end
    %
    %
    % Example 2:
    %
    %     % This example is intended to test how the code functions at a very
    %     % discrete level. The matrix test_mat is rotated counter-clockwise in
    %     % increments of 10 degrees from 0 to 180 degrees. Its initial dimensions 
    %     % are 5x8, but when it is rotated to the 90 degree position, its dimesnions
    %     % are 8x5, demonstrating the appropriate resizing of the matrix to
    %     % accommodate its original data.
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
    %         test_mat_2 = rotate_image_regrid(test_mat,t);
    %         figure, imagesc(test_mat_2);
    %     end
    %
    %
    % See also: rotate_image_no_grid
    %
    % Evan Czako, 8.29.2019
    % -------------------------------------------
    
    



    theta = angle*(pi/180);
    r_matrix = [cos(theta) -sin(theta); sin(theta) cos(theta)];

    % Make conventional x-y grid
    x = linspace(-(size(im,2)-1)/2,(size(im,2)-1)/2,size(im,2));
    y = -linspace(-(size(im,1)-1)/2,(size(im,1)-1)/2,size(im,1));
    [original_x,original_y] = meshgrid(x,y);

    % Make empty matrix of accommodating dimensions
    max_x = max(max(original_x));
    max_y = max(max(original_y));
    expanded_x_max_1 = r_matrix*[max_x; -max_y];
    expanded_y_max_1 = r_matrix*[max_x; max_y];
    expanded_x_max = max(abs(expanded_x_max_1(1)),abs(expanded_y_max_1(1)));
    expanded_y_max = max(abs(expanded_x_max_1(2)),abs(expanded_y_max_1(2)));
    im_2 = nan(round(2*expanded_y_max+1),round(2*expanded_x_max+1));

    % Make corresponding x-y grid
    x = linspace(-(size(im_2,2)-1)/2,(size(im_2,2)-1)/2,size(im_2,2));
    y = -linspace(-(size(im_2,1)-1)/2,(size(im_2,1)-1)/2,size(im_2,1));
    [expanded_x,expanded_y] = meshgrid(x,y);

    % Make x-y grid with rotated coordinates and corresponding index map for expanded matrix
    new_x = zeros(size(im_2));
    new_y = zeros(size(im_2));
    new_i = zeros(size(im_2,1),size(im_2,2),2);
    for row = 1:size(im_2,1)
        for col = 1:size(im_2,2)
            pt = r_matrix*[expanded_x(row,col);expanded_y(row,col)];
            new_x(row,col) = pt(1);
            new_y(row,col) = pt(2);
        end
    end
    new_i(:,:,2) = round(new_x + (size(im,2)+1)/2);
    new_i(:,:,1) = round(-new_y + (size(im,1)+1)/2);


    % Input values from original matrix into the indices specified by new_i
    for row = 1:size(im_2,1)
        for col = 1:size(im_2,2)
            if new_i(row,col,1)>0 && new_i(row,col,2)>0 && new_i(row,col,1)<=size(im,1) && new_i(row,col,2)<=size(im,2)
                im_2(row,col) = im(new_i(row,col,1),new_i(row,col,2));
            end
        end
    end

end