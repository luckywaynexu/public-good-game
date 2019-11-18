%N为参与公共物品博弈的个体数
%L*L方格，r(1<r<5)投资倍乘数；此处r分别取2,3,4
%v=N/L*L,群体密度
%n博弈个体数，n1合作者数，n2背叛者数
%非孤立个体合作者收益p1=（r*n1/n）-1,背叛者收益p0=r*n1/n;
%孤立合作者收益p11=a-1（0=<a=<r）,背叛者收益p00=0,
L=50;
T=10; %选取10个样本
r0=linspace(0.02,1,50);%r0为种群密度
r=[2,3,4];
a=1.5; 
w=0.5;
rs=1;rm=2; %学习和迁移的范围矩阵的边长
rc=zeros(3,50); %产生合作者初始矩阵
for ci=1:50
    N=ceil(L*L*r0(ci)); %统计参与公共物品博弈的个体数
    G=(-1)*ones(L,L); %初始收益矩阵
    b=randperm(L*L);   %对L*L个序列进行随机排序
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1); %随机产生一个只有0,1，-1的矩阵，即一个样本
    G0=G;
    for z=1:3
        G=G0;
        P0=G0;
        [P0]=shouyi(G0,P0,L,r(z),a);   %P0为初始收益矩阵
        %以概率w参与学习并改变策略，为合作或背叛
        for t=1:T*N
            u0=ceil(rand*L);
            v0=ceil(rand*L);
            while G(u0,v0)==-1
                u0=ceil(rand*L);
                v0=ceil(rand*L);
            end
            y=rand;
            if y<=w
                [P0,G]=xuexi(G,P0,L,r(z),a,u0,v0,rs);
            else
                [P0,G]=qianyi(G,P0,L,r(z),a,u0,v0,rm);
            end
        end
        n1=numel(find(G==1));%统计合作者的数目
        %合作者比例
        rc(z,ci)=n1/N;
    end
end
figure(1)
rr1=zeros(1,50);
rr2=zeros(1,50);
rr3=zeros(1,50);
for ci=1:50
    rr1(ci)=rc(1,ci);
end
plot (r0,rr1,'*-')
hold on
for ci=1:50
    rr2(ci)=rc(2,ci);
end
plot(r0,rr2,'^-')
for ci=1:50
    rr3(ci)=rc(3,ci);
end
plot(r0,rr3,'o-')
legend('r=2.0','r=3.0','r=4.0')
xlabel('ρ0')
ylabel('fraction of cooperator')
