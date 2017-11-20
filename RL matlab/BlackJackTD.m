function [Q Pi tr] = BlackJackTD(nIter,epsilon,alpha)
  [S A r pi c] = BlackJackInit()
  q = zeros(S(1),S(2),S(3),A);
  returns = zeros(S(1),S(2),S(3),A);
  tr = zeros(S(1),S(2),S(3),A);
  Q = zeros(S(1),S(2),S(3),A);
  Pi = zeros(S(1),S(2),S(3));
  pi1 = pi;

  for i=1:nIter
    [ep t rew] = EpisodeCard(S,A,r,pi,c,epsilon)
    k=0;
    for j=1:t
      st = ep(t-j+1).s;
      at = ep(t-j+1).a;
      if(st(1)<=21 && k==0) 
         q(st(1),st(2),st(3),at) = q(st(1),st(2),st(3),at) + alpha*(rew-q(st(1),st(2),st(3),at));
         k=1;
      elseif(k==1)
        st1 = ep(t-j+2).s;
        at1 = ep(t-j+2).a;
        if(st(1)<=21 && st(1)>=12)
          q(st(1),st(2),st(3),at) = q(st(1),st(2),st(3),at) + alpha*(q(st1(1),st1(2),st1(3),at1)-q(st(1),st(2),st(3),at));
        endif
      endif
    endfor
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

        