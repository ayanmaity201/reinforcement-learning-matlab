function [S A q pi r] = gamblerinit()
   S = 101;
   A = zeros(1,S);
   pi = zeros(1,S);
   r = zeros(1,S);
   for s=2:S-1
    A(s) = min(s-1,100-s+1);
    r(s) = 0;
   endfor
   r(S) = +1;
   r(1) = 0;
   for s=2:S-1
    pi(s) = floor(A(s)*rand())+1;
   endfor
   q = zeros(S,50);
end

   
   