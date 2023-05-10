angle = deg2rad(214);
R=[cos(angle) -sin(angle);sin(angle) cos(angle)];

Image = imread('pout.tif') % built-in image
figure(1)
imshow(Image);

xyR = uint8(R) * Image;
figure(2)
imshow(xyR);

