function [vpi pi] = vEval(S,A,p,r,v);
   vpi = zeros(1,S);
   for s=1:S
     if(A(s)!=0)
      temp = zeros(1,A(s));
      for a=1:A(s)
         temp(a) = r(s) + v*p(:,s,a); 
      endfor
       [vpi(s) pi(s)]= max(temp);
     else 
       vpi(s) = r(s);
       pi(s) = 0;
     endif
   endfor
 #  vpi(S) = r(S);
 # vpi(S-1) = r(S-1);
 #  pi(S) = 0;
 # pi(S-1) = 0;
 #  pi(5) = 0; 
end
   
     
     
        