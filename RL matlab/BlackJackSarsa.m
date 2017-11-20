function [Q Pi tr] = BlackJackSarsa(nIter)
  [S A r pi c] = BlackJackInit()
  q = zeros(S(1),S(2),S(3),A);
  returns = zeros(S(1),S(2),S(3),A);
  tr = zeros(S(1),S(2),S(3),A);
  Q = zeros(S(1),S(2),S(3),A);
  Pi = zeros(S(1),S(2),S(3));
  pi1 = pi;

  for i=1:nIter
    [ep t rew] = EpisodeCard(S,A,r,pi,c,0.65)
    for j=1:t-1
      st = ep(j).s;
      at = ep(j).a;
      st1 = ep(j+1).s;
      at1 = ep(j+1).a;
      if(st(1)<=21 && st(1)>=12)
          q(st(1),st(2),st(3),at) = q(st(1),st(2),st(3),at) + alpha*(r(st(1),st(2),st(3))+q(st1(1),st1(2),st1(3),at1)-q(st(1),st(2),st(3),at));
      endif
    endfor
    ste = ep(t).s;
    ate = ep(t).a;
    q(ste(1),ste(2),ste(3),ate) = q(ste(1),ste(2),ste(3),ate)+alpha*(rew-q(ste(1),ste(2),ste(3),ate));
    for j=1:t
      st = ep(j).s;
       if(st(1)>=12 && st(1)<=21)
          [~,pi(st(1),st(2),st(3))] = max(q(st(1),st(2),st(3),:));
       endif
    endfor
  endfor
  Pi = pi;
  Q = q;
  
    
  x = 1:21;
  y =1:10;
  figure(1);
  imagesc(y,x,Pi(:,:,1));
  figure(2);
  imagesc(y,x,Pi(:,:,2));
    
    
end

        