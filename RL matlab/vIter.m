function [vop pi] = vIter(nIter)
  [S A p r] = gambler();
  v = zeros(1,S);
  for i=1:nIter
    [vpi pi]= vEval(S,A,p,r,v);
    v = vpi;
  end
  vop = v;
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
  s = [1:S];
  plot(s,vop(s));
end

  