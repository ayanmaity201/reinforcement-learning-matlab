function [vop Pi] = vItergr(nIter)
  [S A r wind] = gridTDinit();
  v = zeros(S(1),S(2));
  for i=1:nIter
    [vpi pi]= vEvalgr(S,A,r,wind,v);
    v = vpi;
  end
  vop = v;
  Pi = pi;
  r
  wind
end
