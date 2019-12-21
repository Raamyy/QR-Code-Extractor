function [x, y] = get_centroid(box_info)
  xMin = ceil(box_info(1));
  yMin = ceil(box_info(2));
  xMax = xMin + box_info(3) - 1;
  yMax = yMin + box_info(4) - 1;
  x = ceil((xMax + xMin) / 2);
  y = ceil((yMax + yMin) / 2);
endfunction
