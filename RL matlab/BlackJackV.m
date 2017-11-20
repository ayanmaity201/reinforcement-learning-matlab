function [V Pi] = BlackJackV(nIter)
  [S A r pi c] = BlackJackInit();
  v = zeros(S(1),S(2),S(3));
  returns = zeros(S(1),S(2),S(3));
  tr = zeros(S(1),S(2),S(3));
  V = zeros(S(1),S(2),S(3));
  Pi = zeros(S(1),S(2),S(3));
  
  for i=1:nIter
    [ep t rew] = EpisodeCard(S,A,r,pi,c);
    for j=1:t
      st = ep(j).s;
      at = ep(j).a;
      if(st(1)<=21 && st(1)>=12)
        returns(st(1),st(2),st(3)) = returns(st(1),st(2),st(3))+rew;
        tr(st(1),st(2),st(3)) = tr(st(1),st(2),st(3))+1;
        v(st(1),st(2),st(3)) = returns(st(1),st(2),st(3))/tr(st(1),st(2),st(3));
      endif
    endfor
  endfor
   
  Pi = pi;
  V = v;
  s1 = [12:21];
  s2 = [1:10];
  z = V(12:21,:,2);
  #hold on;
  mesh(s2,s1,z);
end