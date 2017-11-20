function [ep t] = episodeTD(S,A,pi, epsilon)
  S0 = [floor(8*rand())+1  floor(6*rand())+1];
  G = [6 4];
  A0 = pi(S0(1),S0(2));
  ep = struct();
  ep(1).s = S0
  ep(1).a = action(pi(S0(1),S0(2)))
  t=1;
  while(t<=20)
    t++;
    st = ep(t-1).s + ep(t-1).a
    if(rand<epsilon || isequal(st,G)==1)
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
    if(isequal(at,[0 0])==1)
      ep(t).a = at
      break;
    else
      ep(t).a = at
    endif
  end
end

  
  