%corrinc.m routine
function incor= corrinc2(fx,fy,i1,j1,i2,j2)
fx=fx-min(fx);
fx=fx/max(fx);
fy=fy-min(fy);
fy=fy/max(fy);
s=0:0.01:1;
t=0:0.01:1;
n=length(fx);
q11=0;
q12=0;
q21=0;
q22=0;
k11=[];
k12=[];
k21=[];
k22=[];

for m=1:n
if fx(m)>=s(i1) && fx(m)<=s(i1+10) && fy(m)>=t(j1) && fy(m)<=t(j1+10)
q11=q11+1;
k11=[k11 m];
end
if fx(m)>=s(i1) && fx(m)<=s(i1+10) && fy(m)>=t(j2) && fy(m)<=t(j2+10)
q12=q12+1;
k12=[k12 m];
end
if fx(m)>=s(i2) && fx(m)<=s(i2+10) && fy(m)>=t(j1) && fy(m)<=t(j1+10)
q21=q21+1;
k21=[k21 m];
end
if fx(m)>=s(i2) && fx(m)<=s(i2+10) && fy(m)>=t(j2) && fy(m)<=t(j2+10)
q22=q22+1;
k22=[k22 m];
end
end
q=min(q12,q21);
epsi=q/n;
if q==0
display(’nothing found, set another pair ij’)
else
for l=1:q
fx(k12(l))=s(i2);
end
for l=1:q
fx(k21(l))=s(i1);
end
end
incor=[fx fy];
epsi
end