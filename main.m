% Parts of code are with reference to TT Toolbox provided by Ivan Oseledets et al
% Zichang He 2018.3.12
%-------------------------------
clear, clc
a=rand(2,3,4,5,6);
b=rand(2,3,4,5,6);
err = 10^-5;
tt1 = ttgenerate (a,err);
tt2 = ttgenerate (b,err);
if isequal(size(a),size(b))
    value = ttdot(tt1,tt2);
    fprintf('Inner product = %f', value); 
else
    disp('Illegal input!');
end

