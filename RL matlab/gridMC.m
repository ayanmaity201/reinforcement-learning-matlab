function [Q Pi] = gridMC(nIter)
  [S A r wind pi] = gridTDinit()
  returns = zeros(S(1),S(2),4);
  q = zeros(S(1),S(2),4);
  for i=1:S(1)
    for j=1:S(2)
      for k=1:4
        if(A(i,j,k)==0)
          q(i,j,k) = -10000;
        endif
      endfor
    endfor
  endfor
  q(6,4,:) = 100;
  tr = zeros(S(1),S(2),4);
  Q = zeros(S(1),S(2),4);
  Pi = zeros(S(1),S(2));
  for i=1:nIter
    g = 0;
    pi;
    [ep t] = episodeTD(S,A,pi,0.65);
    for j=1:t
      st = ep(t-j+1).s;
      at = ep(t-j+1).a;
      g = g + r(st(1),st(2));
      if(isequal(st,[6 4])==0)
         ac = inact(at);
        returns(st(1),st(2),ac) = returns(st(1),st(2),ac) + g;
        tr(st(1),st(2),ac) = tr(st(1),st(2),ac)+1;
        q(st(1),st(2),ac) = returns(st(1),st(2),ac)/tr(st(1),st(2),ac);
      endif
    endfor
    for j=1:t
      st = ep(j).s;
      at = ep(j).a;
      if(isequal(at,[0,0])==0)
       [~,pi(st(1),st(2))] = max(q(st(1),st(2),:));
      endif
    endfor
  endfor
  Pi = pi;
  Q = q;
end