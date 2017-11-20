function [vpi pi] = vEvalgr(S,A,r,wind,v)
   vpi = zeros(S(1),S(2));
   for s1=1:S(1)
     for s2=1:S(2)
      if(isequal(A(s1,s2,:),zeros(1,1,4))==0);
        temp = 0;
        for i=1:4
          if(A(s1,s2,i)==1)
              st = [s1,s2] + action(i) + [s2!=S(2)]*wind(s1,s2)*action(1);
              if(st(2)>S(2))
                st(2) = S(2);
              endif
            temp(i) = r(s1,s2) + v(st(1),st(2));
          else
            temp(i) = -1000;
          endif 
        endfor
       [vpi(s1,s2) pi(s1,s2)]= max(temp);
      else 
       vpi(s1,s2) = r(s1,s2);
       pi(s1,s2) = 0;
      endif
     endfor
   endfor
end
   