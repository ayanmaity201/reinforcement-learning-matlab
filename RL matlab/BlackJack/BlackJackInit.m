function [S A r pi c] = BlackJackInit()
  S = [21 10 2];
  A = 2;
  r = zeros(S);
  pi = zeros(S)+1;
  pi(20:21,:,:) = 2;
  c = zeros(1,13)+10;
  c(1) = 11;
  for i=2:10
    c(i) = i;
  endfor
end

  
  