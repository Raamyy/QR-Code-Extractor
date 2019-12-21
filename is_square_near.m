function ans = is_square_near(x, y, squares)
  cmp = 50;
  ans = false;
  for i = 1 : numel(squares)
    box_info = squares(i).BoundingBox;
    xMin = ceil(box_info(1));
    yMin = ceil(box_info(2));
    xMax = xMin + box_info(3) - 1;
    yMax = yMin + box_info(4) - 1;
    if get_distance(x, y, xMin, yMin) <= cmp || get_distance(x, y, xMin, yMax) <= cmp || get_distance(x, y, xMax, yMin) <= cmp || get_distance(x, y, xMax, yMax) <= cmp
      ans = true;
    endif 
  endfor
endfunction
