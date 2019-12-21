function ans = is_qr_fit(outer_square, inner_squares)
  xouter = outer_square(1);
  youter = outer_square(2);
  length = outer_square(3);
  width = outer_square(4);
  ans = true;
  %top left
  if is_square_near(xouter, youter, inner_squares) == false
    ans = false;
  endif
  %top right
  if is_square_near(xouter + width, youter, inner_squares) == false
    ans = false;
  endif
  %bottom left
  if is_square_near(xouter, youter + length, inner_squares) == false
    ans = false;
  endif
endfunction
