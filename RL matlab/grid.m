function [S A p r] = grid()
  S = 12;
  A = zeros(1,S)+4;
  A(5) = 0;
  A(12) = 0;
  A(11) = 0;
  r = zeros(1,S) - 0.1;
  p = zeros(S,S,4);
  for s=1:S-2
    for a=1:A(s)
      if(a==1)
        if(s!=3 && s!=6 && s!=9 && s!=4)
         p(s+1,s,a) = 1;
        else
         p(s,s,a) = 1;
        endif
      endif
      if(a==2)
        if(s!=1 && s!=4 && s!= 7 && s!=10 && s!=6)
          p(s-1,s,a) = 1;
        else
          p(s,s,a) = 1;
        endif
      endif
      if(a==3)
        if(s!=5 && s!=10)
          p(s+3,s,a) = 1;
        else
          p(s,s,a) = 1;
        endif
      endif
      if(a==4)
        if(s!=1 && s!=2 && s!=3 && s!=8)
          p(s-3,s,a) = 1;
        else
          p(s,s,a) = 1;
        endif
      endif
    endfor
  endfor
  r(S) = +1;
  r(S-1) = -1;
end

