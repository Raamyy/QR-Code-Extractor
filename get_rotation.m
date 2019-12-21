%{
  This function calculates the rotation needed to rotate a rotated QR.
%}
function ans = get_rotation(squares)
  [x1, y1] = get_centroid(squares(1).BoundingBox);
  [x2, y2] = get_centroid(squares(2).BoundingBox);
  [x3, y3] = get_centroid(squares(3).BoundingBox);
  len1 = get_distance(x1, y1, x2, y2);
  len2 = get_distance(x1, y1, x3, y3);
  len3 = get_distance(x2, y2, x3, y3);
  MinLen = min(len1, min(len2, len3));
  dy = 0;
  dx = 0;
  if len1 == MinLen
    dy = (y2 - y1);
    dx = (x2 - x1);
  elseif len2 == MinLen
    dy = (y3 - y1);
    dx = (x3 - x1);
  else
    dy = (y3 - y2);
    dx = (x3 - x2);
  endif
  ans = 0;
  if dy == 0
    ans = 0;
  else
    ans = atan2(dy, dx);
  endif
  ans = radian_to_degree(ans);
endfunction
