%intd.m
function I=intd(f)
for i=1:101
for j=1:101
M=[];
for k=1:i
for l=1:j
M(k,l)=f(k,l);
end
end
I(i,j)=(0;012)*sum(sum(M));%step 0.01 in each variable
end
end