function [ps use] = sum_use_p(ps,use,p_c,c)
  if(use==1)
    if(ps+c(p_c)>21)
      ps = ps+c(p_c)-10;
      use = 2;
    else
      ps = ps+p_c;
    endif
  else
    ps = ps + p_c;
  endif
end
  