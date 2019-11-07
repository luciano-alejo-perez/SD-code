%Sd routine

function result=SD(F1,F2,alpha,B)

%Bivariate ecdfs

F=bivacdf(F1.h,F1.y);
G=bivacdf(F2.h,F2.y);
M=length(F1.h);
N=length(F2.h);
%marginales
FX=F(:,101);
FY=F(101,:);
GX=G(:,101);
GY=G(101,:);

%edpSD1 marginal statistic

for i=1:101
for j=1:101
KF(i,j)=-[F(i,j)-FX(i)-FY(j)];
191
KG(i,j)=-[G(i,j)-GX(i)-GY(j)];
end
end
d1=KF-KG;
kol1=max(max(d1));
ikol1=-min(min(d1));
l1=sqrt((M*N)/(M+N))*kol1;
il1=sqrt((M*N)/(M+N))*ikol1;

%H functionals

HF=intd(F);
HG=intd(G);
HFX=HF(:,101);
HFY=HF(101,:);
HGX=HG(:,101);
HGY=HG(101,:);

%edpSD2 marginal statistic

LF=intd(KF);
LG=intd(KG);
d2=LF-LG;
kol2=max(max(d2));
ikol2=-min(min(d2));
l2=sqrt((M*N)/(M+N))*kol2;
il2=sqrt((M*N)/(M+N))*ikol2;

%BDmargin marginal Barret-Donald Test implementation
dx=HFX-HGX;
dy=HFY-HGY;
lx=sqrt((M*N)/(M+N))*max(dx);
ilx=-sqrt((M*N)/(M+N))*min(dx);
ly=sqrt((M*N)/(M+N))*max(dy);
ily=-sqrt((M*N)/(M+N))*min(dy);

%critical values SD1

kappa=kappamn(F1,F2,B);
kappa1=kappa(1,:);
ikappa1=kappa(2,:);
kappa1=sort(kappa1);
ikappa1=sort(ikappa1);
Nl=length(kappa1);
ncrit1=floor((1-alpha)*Nl);
ccritmas1=kappa1(ncrit1);
iccritmas1=ikappa1(ncrit1);

%critical values SD2

kappa2=kappa(3,:);
ikappa2=kappa(4,:);
kappa2=sort(kappa2);
ikappa2=sort(ikappa2);
N2=length(kappa2);
ncrit2=floor((1-alpha)*N2);
ccritmas2=kappa2(ncrit2);
iccritmas2=ikappa2(ncrit2);

%critical values marginals

kappa3=kappa(5,:);
ikappa3=kappa(6,:);
kappa3=sort(kappa3);
ikappa3=sort(ikappa3);
N3=length(kappa3);
ncrit3=floor((1-alpha)*N3);
crbdx=kappa3(ncrit3);
icrbdx=ikappa3(ncrit3);
kappa4=kappa(7,:);
ikappa4=kappa(8,:);
kappa4=sort(kappa4);
ikappa4=sort(ikappa4);
N4=length(kappa4);
ncrit4=floor((1-alpha)*N4);
crbdy=kappa4(ncrit4);
icrbdy=ikappa4(ncrit4);

%TESTS RESULTS
%SD1

if l1<=ccritmas1
SD1mas=1;
elseif il1<=iccritmas1
SD1mas=-1;
else
SD1mas=0;
end

%SD2

%BDmargin
if lx<=crbdx
bdx=1;
elseif ilx<=icrbdx
bdx=-1;
else
bdx=0; end
if ly<=crbdy
bdy=1;
elseif ily<=icrbdy
bdy=-1;
else
bdy=0; end
%joint distrib.
if l2<=ccritmas2 && bdx>=0 && bdy>=0
SD2mas=1;
elseif il2>=iccritmas2 && bdx<=0 && bdy<=0
SD2mas=.11;
else
SD2mas=0;
end
result=[SD1mas l1 ccritmas1 il1 iccritmas1 SD2mas l2 ccritmas2 il2 iccritmas2
bdx lx crbdx bdy ly crbdy]
end