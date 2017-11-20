function [S,A,p,r] = gambler()
  S = 101;
  A = zeros(1,S);
  p = zeros(S,S,50);
  ph = .25;
  for s=2:S-1
    A(s) = min(s-1,100-s+1);
    r(s) = 0;
  endfor
  r(S) = +1;
  r(1) = 0;
  for s=2:S-1
    for a=1:A(s)
      p(s+a,s,a) = ph;  
      p(s-a,s,a) = 1-ph;
    endfor
  endfor
end
