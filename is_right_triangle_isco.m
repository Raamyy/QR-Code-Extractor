%{
  This function returns true if the given lengths construct
  isosceles right angle triangle where len1 = len2 and len3 is hypo
%}
function ans = is_right_triangle_isco(len1, len2, len3)
  ans = false;
  cmp = 10;
  need_len_hypo =  get_hyp(len1, len2);
  if abs(len1 - len2) <= cmp && abs(need_len_hypo - len3) <= cmp
    ans = true;
  endif
endfunction
