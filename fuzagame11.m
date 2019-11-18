L=10;
T=10;
r0=linspace(0.02,1,50);
r=3;
a=[1.0,1.5,2.0]; 
w=0.5;
rs=2;rm=1;
rc=zeros(1,50);
for ci=1:50
    N=ceil(L*L*r0(ci));
    G=(-1)*ones(L,L);
    b=randperm(L*L);
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1);
    P0=G;
    for ai=1:3
        [P0]=shouyi(G,P0,L,r,a(ai));  
        for t=1:T*N
            u0=ceil(rand*L);
            v0=ceil(rand*L);
            while G(u0,v0)==-1
                u0=ceil(rand*L);
                v0=ceil(rand*L);
            end
            y=rand;
            if y<=w
                [P0,G]=xuexi(G,P0,L,r,a(ai),u0,v0,rs);
            else
                [P0,G]=qianyi(G,P0,L,r,a(ai),u0,v0,rm);
            end
        end
        n1=numel(find(G==1));σ
    rc(ai,ci)=n1/N;
    end
end
figure(11)
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
legend('σ=1.0','σ=1.5','σ=2.0')
xlabel('ρ0')
ylabel('fraction of cooperator')
