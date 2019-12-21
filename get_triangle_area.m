function ans = get_triangle_area(len1, len2, len3)
  arr = sort([len1, len2, len3]);
  ans = 0.5 * arr(1) * arr(2);
endfunction
