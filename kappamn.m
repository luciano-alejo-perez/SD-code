%kappamn.m routine

function kappamn= kappamn(F1,F2,B)

N1=length(F1.h);
N2=length(F2.y);
N=N1+N2;
h1=F1.h;
y1=F1.y;
h2=F2.h;
y2=F2.y;
H=[h1 y1; h2 y2]; %pooled sample
kappamn=[];
parfor k=1:B
S=[];

%loop variable initialization 
hb1=[];
hb2=[];
yb1=[];
yb2=[];
d1=[];
d2=[];
dx=[];
dy=[];
KSmn=[];
lmn=[];
KFB=[];
LFB=[];
KGB=[];
LGB=[];
HFB=[];
HGB=[];

for j=1:N
s=floor(rand(1)*N+1);
S=[S s];
end
for l=1:N1
hb1(l)=H(S(l),1);
yb1(l)=H(S(l),2);
end

for l=1:N2
hb2(l)=H(S(N1+l),1);
yb2(l)=H(S(N1+l),2);
end
FB=bivacdf(hb1,yb1);
GB=bivacdf(hb2,yb2);
FBX=FB(:,101);
FBY=FB(101,:);
GBX=GB(:,101);
GBY=GB(101,:);
for i=1:101
for j=1:101
KFB(i,j)=-[FB(i,j)-FBX(i)-FBY(j)];
KGB(i,j)=-[GB(i,j)-GBX(i)-GBY(j)];
end
end

d1=KFB-KGB;
KSmn1=max(max(d1));
iKSmn1=-min(min(d1));
lmn1=sqrt((N1*N2)/N)*KSmn1;
ilmn1=sqrt((N1*N2)/N)*iKSmn1;

%SD2
LFB=intd(KFB);
LGB=intd(KGB);
d2=LFB-LGB;
KSmn2=max(max(d2));
iKSmn2=-min(min(d2));
lmn2=sqrt((N1*N2)/N)*KSmn2;
ilmn2=sqrt((N1*N2)/N)*iKSmn2;
%BDmargin
HFB=intd(FB);
HGB=intd(GB);
HFBX=HFB(:,101);
HGBX=HGB(:,101);


HFBY=HFB(101,:);
HGBY=HGB(101,:);
dxB=HFBX-HGBX;
dyB=HFBY-HGBY;
lxB=sqrt((N1*N2)/N)*max(dxB);
lyB=sqrt((N1*N2)/N)*max(dyB);
ilxB=-sqrt((N1*N2)/N)*(-min(dxB));
ilyB=-sqrt((N1*N2)/N)*(-min(dyB));
%distrib. simulada de los edps
lmn=[lmn1; ilmn1; lmn2; ilmn2; lxB; ilxB; lyB; ilyB];
kappamn=[kappamn lmn];
end