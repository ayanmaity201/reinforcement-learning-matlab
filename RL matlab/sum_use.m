function [ps use] = sum_use(pc,c)
  ps = 0;
  use = 2;
  [~,nc] = size(pc);
  isAce = 0;
  for i=1:nc
    ps = ps + c(pc(i));
    if(pc(i)==1)
      isAce = 1;
    endif
  endfor
  if(ps>21 && isAce==1)
    ps = ps - 10;
    use = 2;
  elseif(ps<=21 && isAce==1)
    use = 1;
  endif
end
  
  
  
  
  