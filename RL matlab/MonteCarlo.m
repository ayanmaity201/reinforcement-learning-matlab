function [Q Pi] = MonteCarlo(nIter)
  [S A q pi r] = gamblerinit();
  returns = zeros(S,50);
  tr = zeros(S,50);
  Q = zeros(S,50);
  Pi = zeros(1,S);
  for i=1:nIter
    g = 0;
    pi;
    [ep t] = episode(S,A,pi);
    for j=1:t
      s = ep(t-j+1,1);
      a = ep(t-j+1,2);
      g = g + r(s);
      if(A(s)!=0)
        returns(s,a) = returns(s,a) + g;
        tr(s,a) = tr(s,a)+1;
        q(s,a) = returns(s,a)/tr(s,a);
      endif
    endfor
    for j=1:t
      s = ep(j,1);
      if(A(s)!=0)
       [~,pi(s)] = max(q(s,:));
      endif
    endfor
  endfor
  Pi = pi;
  Q = q;
  s= [1:S];
  plot(s,pi(s));
end

    
  