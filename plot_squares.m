function plot_squares(img, blobMeasurements)
  figure, imshow(img);
  for i = 1 : numel(blobMeasurements)
    rectangle('Position', blobMeasurements(i).BoundingBox, 'EdgeColor', 'r');
  endfor
endfunction
