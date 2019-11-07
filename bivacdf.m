%bivacdf.m routine
function funcdist=bivacdf(x,y)
mx=mean(x);
my=mean(y);
x=x/mx; % normalizationn=True
y=y/my;
x=x-min(x); % sets [0,1] support
x=x/max(x);
y=y-min(y);
y=y/max(y);
s=0:0.01:1;
t=0:0.01:1;
n=length(s);
for i=1:n
for j=1:n
F=0;
for k=1:length(x)
if x(k)<=s(i) && y(k)<=t(j)
F=F+1;
end
cum(i,j)=F/length(x);
end
end
end
figure
surf(s,t,cum)
funcdist=cum;