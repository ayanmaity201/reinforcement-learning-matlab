function [Q Pi] = MonteCarlo(nIter)
  [S A q pi r] = gamblerinit();
  returns = zeros(1,S,max(A));
  tr = zeros(1,S,max(A));
  for i=1:nIter
    g = 0;
    [ep t] = episode(S,A,pi);
    for j=t:1
      s = ep(j,1);
      a = ep(j,2);
      g = g + r(s);
      returns(s,a) = returns(s,a) + g;
      tr(s,a) = tr(s,a)+1;
      q(s,a) = returns(s,a)/tr(s,a);
    endfor
    for j=1:t
      s = ep(j,1);
      [~,pi(s)] = max(q(s,:));
    endfor
  endfor
  Pi = pi;
  Q = q;
end

    
  