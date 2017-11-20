function act = action(n)
  if(n==1)
   act = [0 +1];
  elseif (n==2)
    act = [0 -1];
  elseif(n==3)
    act = [+1 0];
  elseif(n==4)
    act = [-1 0];
  else
    act =[0 0];
end

