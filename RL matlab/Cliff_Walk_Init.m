function [S G A r tr pi] = Cliff_Walk_Init()
  S = [12 4];
  G = [12 1];
  A = zeros(S(1),S(2),4)+1;
  A(2:11,1,:) = 0;
  A(1,:,4) = 0;
  A(12,:,3) = 0;
  A(:,4,1) = 0;
  A(:,1,2) = 0;
  A(12,1,:) = 0;
  tr = zeros(S(1),S(2));
  for i=1:S(1)
    for j=1:S(2)
      for k=1:4
        if(A(i,j,k)==1)
          tr(i,j) = 1;
        endif
      endfor
    endfor
  endfor
  r = zeros(S(1),S(2))-4;
  r(2:11,1) = -100;
  r(12,1) = 100;
  pi = zeros(S(1),S(2));
  for i=1:S(1)
    for j=1:S(2)
      if(tr(i,j)==1)
        while(1)
         pi(i,j) = floor(4*rand())+1;
         if(A(i,j,pi(i,j))==1)
            break;
         endif
        endwhile
      endif
    endfor
  endfor
 end 