function [S,A,p,r] = initialize()
  S=6;
  for s=1:S
     A(s) = 2;
  end
  A(1) = 1;
  A(S) = 0;
  r = zeros(1,S);
  p = zeros(S,S,2);
  for s=2:S-1
      for a=1:A(s)
        if(a==1)
           p(s+1,s,a) = .75;
           p(s-1,s,a) = .25;
        else
           p(s-1,s,a) = .75;
           p(s+1,s,a) = .25;
        end
      end
      r(s) = -0.1;
  end
  p(2,1,1) = 1;
  #p(S,S,1) = 1;
  #p(S,S,2) = 1;
  r(1) = -1;
  r(S) = +1;
end

 
       
           
