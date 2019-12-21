%{
  This function returns the 3 squares that forms every QR Code.
  We know that these Squares forms a QR Code that they make:
  an Isosceles Right Angled Triangle, if many exists we take the one with least area.
%}

function [ans, ans2] = get_similar_boxes_triangles(boxes)
  % only if one QR exist
  if numel(boxes) <= 3
    ans = boxes;
    ans2 = boxes;
    return;
  endif
  cmp = 500;
  cmp2 = 300;
  ans = [];
  ans2 = [];
  number_of_boxes = numel(boxes);
  mark = zeros(number_of_boxes);
  for i = 1 : number_of_boxes
    if mark(i) == 1
      continue;
    endif
    area1 = area_box(boxes(i).BoundingBox);
    Min = 1000000000;
    idx1 = -1;
    idx2 = -1;
    for j = 1: number_of_boxes
      if mark(j) == 1
        continue;
      endif
      area2 = area_box(boxes(j).BoundingBox);
      if abs(area1 - area2) > cmp || j == i
        continue;
      endif
      for k = 1: number_of_boxes
        if mark(k) == 1
          continue;
        endif
        area3 = area_box(boxes(k).BoundingBox);
        if abs(area1 - area3) > cmp && abs(area2 - area3) > cmp || k == j || k == i
          continue;
        endif
        [x1, y1] = get_centroid(boxes(i).BoundingBox);
        [x2, y2] = get_centroid(boxes(j).BoundingBox);
        [x3, y3] = get_centroid(boxes(k).BoundingBox);
        len1 = get_distance(x1, y1, x2, y2);
        len2 = get_distance(x1, y1, x3, y3);
        len3 = get_distance(x2, y2, x3, y3);
        if is_right_triangle_isco(len1, len2, len3) || is_right_triangle_isco(len1, len3, len2) || is_right_triangle_isco(len2, len3, len1)
          if (min(len1, len2) < Min)
            Min = min(len1, len2);
            idx1 = j;
            idx2 = k;
          endif
        endif
      endfor
    endfor
    if idx1 != -1
        j = idx1;
        k = idx2;
        [x1, y1] = get_centroid(boxes(i).BoundingBox);
        [x2, y2] = get_centroid(boxes(j).BoundingBox);
        [x3, y3] = get_centroid(boxes(k).BoundingBox);
        len1 = get_distance(x1, y1, x2, y2);
        len2 = get_distance(x1, y1, x3, y3);
        len3 = get_distance(x2, y2, x3, y3);
        if is_right_triangle_isco(len1, len2, len3)
            mark(i) = 1;
            mark(j) = 1;
            mark(k) = 1;
            ans2 = [ans2, [boxes(i),boxes(j),boxes(k)]];
          elseif is_right_triangle_isco(len1, len3, len2)
            mark(i) = 1;
            mark(j) = 1;
            mark(k) = 1;
            ans2 = [ans2, [boxes(i),boxes(k),boxes(j)]];
          elseif is_right_triangle_isco(len2, len3, len1)
            mark(i) = 1;
            mark(j) = 1;
            mark(k) = 1;
            ans2 = [ans2, [boxes(j),boxes(k),boxes(i)]];
          endif
      endif
  endfor
  for i = 1 : number_of_boxes
    if mark(i) == 1
      ans = [ans, boxes(i)];
    endif
  endfor
endfunction
