function [vpi,pi] = vEval(S,A,p,r,v)
   vpi = zeros(1,S);
   for s=0;S
     temp = zeros(1,A(s));
     for a=0;A(s)
        temp(a) = r(a,s) + v*(p(s,a)') ;
     end
     [vpi(s) , pi(s)] = max(temp(a));
   end
end
   
     
     
        