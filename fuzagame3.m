L=50;
T=100;
r0=0.3;
r=3;
a=1.5; 
w=0.5;
rs=2;rm=1;
N=ceil(L*L*r0);
G=(-1)*ones(L,L);
b=randperm(L*L);
i=b(1:N);
G(i)=ceil(2*rand(1,N)-1);
P0=G;
[P0]=shouyi(G,P0,L,r,a);  
for t=1:T*N
    u0=ceil(rand*L);
    v0=ceil(rand*L);
    while G(u0,v0)==-1
        u0=ceil(rand*L);
        v0=ceil(rand*L);
    end
    y=rand;
    if y<=w
        [P0,G]=xuexi(G,P0,L,r,a,u0,v0,rs);
    else
        [P0,G]=qianyi(G,P0,L,r,a,u0,v0,rm);
    end
end
figure(3)
[row1,col1]=find(G==1);%记录合作者的点，在格点上标上红加号
[row2,col2]=find(G==0);%记录背叛者的点，在格点上标上蓝圈圈
plot(row1,col1,'r+');
hold on
plot(row2,col2,'o');
title('t=100');
