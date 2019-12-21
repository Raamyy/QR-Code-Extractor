%{
  After calling the previous function, This function removes all the squares that contains any other squares.
%}
function ans = remove_not_single_boxes(boxes)
  number_of_boxes = numel(boxes);
  ans = [];
  for i = 1 : number_of_boxes
    number_of_inside = 0;
    for j = 1 : number_of_boxes
      if i == j
        continue;
      endif
      if inside(boxes(i).BoundingBox, boxes(j).BoundingBox)
        number_of_inside = number_of_inside + 1;
      endif
    endfor
    if number_of_inside == 0
      ans = [ans, boxes(i)];
    endif
  endfor
endfunction
