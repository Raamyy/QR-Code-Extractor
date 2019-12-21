%{
  This function returns the squares that forms the corners of the QRs
%}
function ans = get_qr_corner_squares(img)
  gray_image = rgb2gray(img);
  bw = edge(gray_image, 'Canny', 0.3);
  bw = bwareaopen(bw, 10);
  %figure, imshow(bw);
  [labeledImage numberOfObjcts] = bwlabel(bw);
  blobMeasurements = regionprops(labeledImage, 'BoundingBox', 'Perimeter','FilledArea', 'ConvexHull', 'Centroid', 'Extent', 'Eccentricity'); 
  %blobMeasurements = get_squares(blobMeasurements);
  blobMeasurements = remove_not_similar_boxes(blobMeasurements);
  
  blobMeasurements = remove_single_boxes(blobMeasurements);
  blobMeasurements = remove_single_boxes(blobMeasurements);
  %plot_squares(bw, blobMeasurements);
  blobMeasurements = remove_not_single_boxes(blobMeasurements);
  
  [t1, t2] = get_similar_boxes_triangles(blobMeasurements);
  blobMeasurements = t2;
  ans = blobMeasurements;
  %plot_squares(bw, blobMeasurements);
endfunction
