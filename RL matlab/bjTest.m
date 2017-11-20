function  results = bjTest(Pi,nTest)
  [S A r pi c] = BlackJackInit();
  results = zeros(1,3);
  for i=1:nTest
    [ep t rew] = EpisodeCard(S,A,r,Pi,c,1)
    results(rew+2) = results(rew+2)+1;
  endfor
end
