pkg load image;
clc;
clear;

img2 = imread("TestCases/1.1.bmp");
%figure, imshow(img2);
corners = get_qr_corner_squares(img2);
disp(numel(corners));
angle = get_rotation(corners);

for i = 1 : 4
  img = imrotate(img2, angle,'Bilinear');
  %figure, imshow(img);
  corners = get_qr_corner_squares(img);
  qr_squares = get_qr_codes_squares(corners);
  fit = true;
  if numel(qr_squares) != 0 && numel(corners) >= 3
    for i = 1 : numel(qr_squares) / 4
      if !is_qr_fit([qr_squares((i - 1) * 4 + 1), qr_squares((i - 1) * 4 + 2), qr_squares((i - 1) * 4 + 3), qr_squares((i - 1) * 4 + 4)], [corners((i - 1) * 3 + 1), corners((i - 1) * 3 + 2), corners((i - 1) * 3 + 3)])
        fit = false;
      endif
    endfor
  else
    fit = false;
  endif
  % for displaying image
  if fit
    figure, imshow(img);
    for i = 1 : numel(corners)
      boxinfo = corners(i).BoundingBox;
      rectangle('position', boxinfo, 'EdgeColor', 'r');
    endfor
    idx = 1;
    while idx <= numel(qr_squares)
      rectangle('position', [qr_squares(idx), qr_squares(idx+1), qr_squares(idx + 2), qr_squares(idx + 3)], 'EdgeColor', 'g');
      idx = idx + 4;
    endwhile
    idx = 1;
    while idx <= numel(qr_squares)
      final_image = imcrop(img, [qr_squares(idx) - 5, qr_squares(idx+1) - 5, qr_squares(idx + 2) + 10, qr_squares(idx + 3) + 10]);
      figure, imshow(final_image);
      idx = idx + 4;
    endwhile
    break;
  endif
  angle = angle + 90;
endfor
