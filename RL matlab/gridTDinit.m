function [S A r wind pi] = gridTDinit()
  S = [8 6];
  G = [6 4];
  A = zeros(S(1),S(2),4)+ 1;
  A(6,4,:) = 0;
  A(1,:,4) = 0;
  A(8,:,3) = 0;
  A(:,1,2) = 0;
  A(:,6,1) = 0;
  r = zeros(S(1),S(2)) - 10;
  r(6,4) = +100;
  r(6,3) = -300;
  r(5,4) = -300;
  r(5,5) = -300;
  wind = zeros(S(1),S(2));
  wind(4,:) = 1;
  wind(5,:) = 1;
  wind(6,:) = 1;
  wind(7,:) = 1;
  pi = zeros(S(1),S(2));
  for i=1:S(1)
    for j=1:S(2)
      if(isequal([i,j],[6,4])==0)
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
