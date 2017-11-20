function [ep t rew] = EpisodeCard2(S,A,r,pi,c,epsilon)
  ps = 0;
  ds = 0;
  dc = 0;
  p_c = 0;
  #pc(1:2) = cardGen(2)
  dc(1:2) = cardGen(2)
  c(1) = 1;
  up_card = c(dc(1))
  c(11) = 11;
  ps = floor(10*rand()+12);  
  usep = floor(2*rand()+1); 
  [ds used]= sum_use(dc,c)
  ep = struct();  
  ep(1).s = [ps up_card usep];
  st = ep(1).s
  ep(1).a = pi(st(1),st(2),st(3));
  at = ep(1).a
  t=1;
  rew = 0;
  if(ps<21 && ds<21)
    while(at==1)            ## player's turn
      t++;
      p_c = cardGen(1)
      [ps usep] = sum_use_p(ps,usep,p_c,c);
      ep(t).s = [ps up_card usep];
      st = ep(t).s
      if(ps>=21)
        at = 2;
        ep(t).a = at
        break;
      endif
      if(rand<epsilon)
        ep(t).a = pi(st(1),st(2),st(3));
      else
        if( pi(st(1),st(2),st(3))==2)
          ep(t).a = 1;
        else
          ep(t).a = 2;
        endif
      endif
      at = ep(t).a
      if(at==2)
        break;
      endif
    endwhile
  
    while(1)           ## dealer's turn
      if(ds<17)
        dc(end+1) = cardGen(1)
        [ds used] = sum_use(dc,c)
      else
        break;
      endif
    endwhile
  endif
  
  if( ps>21 ) % player went bust
    rew = -1; 
    return; 
  endif
  if( ds>21 ) % dealer went bust
    rew = +1; 
    return; 
  endif
  if( ps==ds ) % a tie
    rew = 0; 
   return;
  endif
  if( ps>ds ) % the larger hand wins
    rew = +1; 
  else
    rew = -1; 
  endif
end