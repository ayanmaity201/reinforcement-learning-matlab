function [Q Pi tr] = BJTd(nIter,epsilon,alpha)
  [S A r pi c] = BlackJackInit()
  q = zeros(S(1),S(2),S(3),A);
  returns = zeros(S(1),S(2),S(3),A);
  tr = zeros(S(1),S(2),S(3),A);
  Q = zeros(S(1),S(2),S(3),A);
  Pi = zeros(S(1),S(2),S(3));
  pi1 = pi;

  for i=1:nIter
    [ep t rew] = EpisodeCard(S,A,r,pi,c,epsilon)
    for j=1:t-1
      st = ep(j).s;
      at = ep(j).a;
      st1 = ep(j+1).s;
      at1 = ep(j+1).a;
      if(st(1)<=21 && st(1)>=12 && st1(1)<=21 && st1(1)>=12)
          q(st(1),st(2),st(3),at) = q(st(1),st(2),st(3),at) + alpha*(q(st1(1),st1(2),st1(3),at1)-q(st(1),st(2),st(3),at));
      endif
    endfor
    if(t>1) 
      ste = ep(t-1).s;
      ate = ep(t-1).a;
      ste1 = ep(t).s;
      ate1 = ep(t).a;
      if(ste1(1)<=21 && ste1(1)>=12)
        q(ste1(1),ste1(2),ste1(3),ate1) = q(ste1(1),ste1(2),ste1(3),ate1)+alpha*(rew-q(ste1(1),ste1(2),ste1(3),ate1));
      else
        q(ste(1),ste(2),ste(3),ate) = q(ste(1),ste(2),ste(3),ate)+alpha*(rew-q(ste(1),ste(2),ste(3),ate));
      endif
    else
      ste = ep(t).s;
      ate = ep(t).a;
      q(ste(1),ste(2),ste(3),ate) = q(ste(1),ste(2),ste(3),ate)+alpha*(rew-q(ste(1),ste(2),ste(3),ate));
    endif
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

        