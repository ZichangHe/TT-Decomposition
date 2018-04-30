function value = ttdot(tt1,tt2)
d=tt1.d; 
n=tt1.n;
r1=tt1.r; r2=tt2.r; 
core1=tt1.core; core2=tt2.core;
for i= 1:d
    tt1.core{i}=permute(tt1.core{i},[1,3,2]); %for easily pick up a desired matrix 
    tt2.core{i}=permute(tt2.core{i},[1,3,2]);
end
v=cell(1,d);
v{1}=zeros(1,r1(1)*r2(1));
for i=1:n(1) 
    v{1}=v{1}+kron(tt1.core{1}(:,:,i),tt2.core{1}(:,:,i)); % initialize v
end
for k=2:d
     p=zeros(1,r1(k+1)*r2(k+1));
    for i=1:n(k)
        p=p+v{k-1}*kron(tt1.core{k}(:,:,i),tt2.core{k}(:,:,i));
    end
    v{k}=p; %update v
end
value=v{d};