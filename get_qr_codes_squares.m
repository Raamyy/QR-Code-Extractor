function ans = get_qr_codes_squares(boxes)
  cmp = 200;
  ans = [];
  number_of_boxes = numel(boxes);
  idx = 1;
  while idx <= number_of_boxes
    P1_boundig = boxes(idx).BoundingBox;
    P2_boundig = boxes(idx+1).BoundingBox;
    P3_boundig = boxes(idx+2).BoundingBox;
    most_left = min(P1_boundig(1),min(P2_boundig(1),P3_boundig(1)));
    most_top = min(P1_boundig(2),min(P2_boundig(2),P3_boundig(2)));
    most_right = max(get_bounding_right(P1_boundig),max(get_bounding_right(P2_boundig),get_bounding_right(P3_boundig))); %left+wdith
    most_bottom = max(get_bounding_buttom(P1_boundig),max(get_bounding_buttom(P2_boundig),get_bounding_buttom(P3_boundig))); % top+length
    width = abs(most_left-most_right);
    height = abs(most_top-most_bottom);
    ans = [ans,most_left,most_top, width, height]; 
    idx = idx + 3;
  endwhile
endfunction
