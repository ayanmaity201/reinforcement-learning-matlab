function [ep t] = episodeCW(S,A,tr,r,pi,epsilon)
  S0 = [1 1];
  A0 = pi(S0(1),S0(2));
  ep = struct();
  ep(1).s = S0
  ep(1).a = action(pi(S0(1),S0(2)))
  t=1;
  while(t<=30)
    t++;
    st = ep(t-1).s + ep(t-1).a
    if(rand<epsilon || tr(st(1),st(2))==0)
      at = action(pi(st(1),st(2)))
    else
      while(1)
        x = floor(4*rand())+1
        at = action(x);
        if(A(st(1),st(2),x)==1)
          break;
        endif
      endwhile
    endif
    ep(t).s = st
    if(tr(st(1),st(2))==0)
      ep(t).a = at
      break;
    else
      ep(t).a = at
    endif
  end
end

  
  