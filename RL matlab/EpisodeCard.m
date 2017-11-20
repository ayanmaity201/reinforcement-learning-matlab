function [ep t rew] = EpisodeCard(S,A,r,pi,c,epsilon)
  ps = 0;
  ds = 0;
  pc = 0;
  dc = 0;
  pc(1:2) = cardGen(2)
  dc(1:2) = cardGen(2)
  c(1) = 1;
  up_card = c(dc(1))
  c(1) = 11;
  [ps usep]= handValue(pc)
  [ds used]= handValue(dc)
  ep = struct();  
  ep(1).s = [ps up_card usep];
  st = ep(1).s
  ep(1).a = pi(st(1),st(2),st(3));
  at = ep(1).a
  t=1;
  rew = 0;
  if(ps<21 && ds<21)
    while at==1            ## player's turn
      t++;
      [~,nc] = size(pc);
      pc(nc+1) = cardGen(1)
      [ps usep] = handValue(pc)
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
        [ds used] = handValue(dc)
      else
        break;
      endif
    endwhile
  endif
  
  rew = reward(ps,ds);
end

      
    
    
        
      
      
   
  
  
  
      
      