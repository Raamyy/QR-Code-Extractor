%{
  This function returns all the shapes that forms a square inside the image
%}
function ans = get_squares(blobMeasurements)
  ans = [];
  for i = 1 : numel(blobMeasurements)
    [k, area] = convhull(blobMeasurements(i).ConvexHull);
    area = blobMeasurements(i).FilledArea;
    circularity = blobMeasurements(i).Perimeter.^2 ./ (4 * pi * area);
    if (circularity > 0.8 && circularity < 1.4) || ((blobMeasurements(i).Extent>=0.78) & (blobMeasurements(i).Extent<0.95) & (blobMeasurements(i).Eccentricity<0.9) & (blobMeasurements(i).Eccentricity>=0.2)) || check_convex_hull_square(blobMeasurements(i).ConvexHull, blobMeasurements(i).Centroid)
      ans = [ans, blobMeasurements(i)];
    endif
  endfor
endfunction
