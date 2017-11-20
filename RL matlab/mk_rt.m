function S = mk_rt(choice)

switch choice,
 case 1
  S = zeros(16,16); 
  S(16,4:12) = 1; 
  S(15,4:12) = 1; 
  S(10:14,5:12) = 1; 
  S(8:9,7:12) = 1; 
  S(7,7:13) = 1; 
  S(6,8:13) = 1; 
  S(5,8:16) = 1; 
  S(4,8:16) = 1; 
  S(3,9:16) = 1; 
  S(2,11:16) = 1; 
 otherwise
end
