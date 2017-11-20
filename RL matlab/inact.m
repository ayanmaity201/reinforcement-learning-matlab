function inac = inact(a)
  if(isequal(a,[0 +1]))
    inac = 1;
  elseif(isequal(a,[0 -1]))
    inac = 2;
  elseif(isequal(a,[+1 0]))
    inac = 3;
  elseif(isequal(a,[-1 0]))
    inac = 4;
  else
    inac = 0;
end