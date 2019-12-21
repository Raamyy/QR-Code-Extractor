%{
  This function removes all the squares that doesn't have any other squares inside.
  
  Since the QR square consists of one big square containing 2 smaller squares, So this function is called twice.
%}
function ans = remove_single_boxes(boxes)
  number_of_boxes = numel(boxes);
  ans = [];
  for i = 1 : number_of_boxes
    number_in_boxes = 0;
    for j = 1: number_of_boxes
      if i == j
        continue;
      endif
      if inside(boxes(i).BoundingBox, boxes(j).BoundingBox)
        number_in_boxes = number_in_boxes + 1;
      endif
    endfor
    if number_in_boxes > 0
      ans = [ans, boxes(i)];
    endif
  endfor
endfunction
