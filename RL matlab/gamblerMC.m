function [S A q pi] = gamblerMC()
   S = 101;
   A = zeros(1,S);
   pi = zeros(1,S);
   for s=2:S-1
    A(s) = min(s-1,100-s+1);
   endfor
   for s=2:S-1
    pi(s) = floor(A(s)*rand())+1;
   endfor
   q = zeros(1,S);
end

   
   