  if(ps==21)
    if(ds==21)
      rew = 0;
    else
      rew = +1;
    endif
  elseif(ps>21)
    if(ds>21)
      rew = 0;
    else
      rew = -1;
    endif
  elseif(ps<21)
    if(ds<ps)
      rew = +1;
    elseif(ds==ps)
      rew = 0;
    else
      if(ds<=21)
        rew = -1;
      else
        rew = +1;
      endif
    endif
  endif   
end 