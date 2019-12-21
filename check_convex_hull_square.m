function ans = check_convex_hull_square(convex_hull, centroid)
  cmp = 10;
  ans = true;
  if numel(convex_hull) != 0
    dist = get_distance(convex_hull(1, 1), convex_hull(1, 2), centroid(1), centroid(2));
    [n m] = size(convex_hull);
    for i = 2 : n
      new_dist = get_distance(convex_hull(i, 1), convex_hull(i, 2), centroid(1), centroid(2));
      if abs(new_dist - dist) > cmp
        ans = false;
      endif
    endfor
  endif
endfunction
