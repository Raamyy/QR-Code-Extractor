function ans = inside(box_info1, box_info2)
    xMin1 = ceil(box_info1(1));
    yMin1 = ceil(box_info1(2));
    xMax1 = xMin1 + box_info1(3) - 1;
    yMax1 = yMin1 + box_info1(4) - 1;
    xMin2 = ceil(box_info2(1));
    yMin2 = ceil(box_info2(2));
    xMax2 = xMin2 + box_info2(3) - 1;
    yMax2 = yMin2 + box_info2(4) - 1;
    ans = false;
    if xMin2 >= xMin1 && xMin2 <= xMax1 && xMax2 >= xMin1 && xMax2 <= xMax1 && yMin2 >= yMin1 && yMin2 <= yMax1 && yMax2 >= yMin1 && yMax2 <= yMax1
      ans = true;
    endif
endfunction
