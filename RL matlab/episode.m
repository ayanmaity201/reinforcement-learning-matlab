function [ep t] = episode(S,A,pi)
  while(1)
     S0 = floor(S*rand())+1;
     if(A(S0)!=0)
      break;
     endif
  endwhile
  A0 = floor(A(S0)*rand())+1;
  ep(1,1) = S0;
  ep(1,2) = A0;
  t=1;
  while(1)
    t++;
    #sleep(.1);
    x = floor(100000*rand())+1;
    if(x<=40000)
      ep(t,1) = ep(t-1,1)+ep(t-1,2);
    else
      ep(t,1) = ep(t-1,1)-ep(t-1,2);
    endif
    if(A(ep(t,1))!=0)
      ep(t,2) = pi(ep(t,1));
    else
      ep(t,2) = 0;
      break;
    endif
  endwhile
end

    
    
  
  