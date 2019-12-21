function ans = get_qr_corners(boxes)
  ans = [];
  for i = 1 : numel(boxes)
    cnt = 0;
    for j = 1 : numel(boxes)
      if i == j
        continue;
      endif
      if inside(boxes(i).BoundingBox, boxes(j).BoundingBox)
        cnt = cnt + 1;
      endif
    endfor
    if cnt == 2
      ans = [ans, boxes(i)];
    endif
  endfor
endfunction
