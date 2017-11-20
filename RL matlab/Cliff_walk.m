function [Q Pi] = Cliff_walk(nIter,epsilon,alpha)
  [S G A r tr pi] = Cliff_Walk_Init()
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
  q(12,1,:) = 100;
  q(2:11,1,:) = -100;
  Q = zeros(S(1),S(2),4);
  Pi = zeros(S(1),S(2));
  for i=1:nIter
    g = 0;
    pi;
    [ep t] = episodeCW(S,A,tr,r,pi,epsilon);#epsilon = 0.8
    for j=1:t
      st = ep(j).s;
      at = ep(j).a;
      if(j<t)
        st1 = ep(j+1).s;
        at1 = ep(j+1).a;
        if(tr(st(1),st(2))==1)
           ac = inact(at);
           ac1 = inact(at1);
           if(tr(st1(1),st1(2))==0)
            ac1 = 1;
           endif
           q(st(1),st(2),ac) = q(st(1),st(2),ac) + alpha*(r(st(1),st(2))+q(st1(1),st1(2),ac1)-q(st(1),st(2),ac));#alpha = 0.1
        endif
      endif
    endfor
    for j=1:t-1
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