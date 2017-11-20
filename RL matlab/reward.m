function rew = reward(ps,ds)
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