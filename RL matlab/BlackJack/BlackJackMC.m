function [Q Pi tr] = BlackJackMC(nIter)
  [S A r pi c] = BlackJackInit()
  q = zeros(S(1),S(2),S(3),A);
  returns = zeros(S(1),S(2),S(3),A);
  tr = zeros(S(1),S(2),S(3),A);
  Q = zeros(S(1),S(2),S(3),A);
  Pi = zeros(S(1),S(2),S(3));
  pi1 = pi;

  for i=1:nIter
    [ep t rew] = EpisodeCard(S,A,r,pi,c,0.6)
    for j=1:t
      st = ep(j).s;
      at = ep(j).a;
      if(st(1)<=21 && st(1)>=12)
        returns(st(1),st(2),st(3),at) = returns(st(1),st(2),st(3),at)+rew;
        tr(st(1),st(2),st(3),at) = tr(st(1),st(2),st(3),at)+1;
        q(st(1),st(2),st(3),at) = returns(st(1),st(2),st(3),at)/tr(st(1),st(2),st(3),at);
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
  
    
  x = 11:21;
  y =1:10;
  figure(1);
  imagesc(y,x,Pi(11:21,:,1));
  figure(2);
  imagesc(y,x,Pi(11:21,:,2));
    
    
end

        