%{
  Since all the QR Squares should be similar in size, so this  function removes all the squares that don't
  have any similar squares in area.
%}
function ans = remove_not_similar_boxes(boxes)
    ans = [];
    mark = zeros(numel(boxes));
    cmp = 1000;
    for i = 1 : numel(boxes)
      similar = 0;
      area1 = area_box(boxes(i).BoundingBox);
      for j = 1 : numel(boxes)
        if i == j
          continue;
        endif
        area2 = area_box(boxes(j).BoundingBox);
        if abs(area1 - area2) <= cmp
          mark(i)=1;
          mark(j)=1;
        endif
      endfor
    endfor
    for i = 1 : numel(boxes)
      if mark(i) == 1
        ans = [ans, boxes(i)];
      endif
    endfor
endfunction
