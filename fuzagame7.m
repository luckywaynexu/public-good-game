L=50;
T=10;
r0=[0.45,0.8];
r=linspace(1,5,40);
a=1.5; 
w=0.5;
rs=1;
rm=2;
rc=zeros(2,40);
for ci=1:2
    N=ceil(L*L*r0(ci));
    G=(-1)*ones(L,L);
    b=randperm(L*L);
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1);
    G0=G;
    P0=G;
    parfor ri=1:40
        G=G0;
        P0=G;
        [P0]=shouyi(G0,P0,L,r(ri),a); 
        for t=1:T*N
            u0=ceil(rand*L);
            v0=ceil(rand*L);
            while G(u0,v0)==-1
                u0=ceil(rand*L);
                v0=ceil(rand*L);
            end
            y=rand;
            if y<=w
                [P0,G]=xuexi(G,P0,L,r(ri),a,u0,v0,rs);
            else
                [P0,G]=qianyi(G,P0,L,r(ri),a,u0,v0,rm);
            end
        end
        n1=numel(find(G==1));
        rc(ci,ri)=n1/N;
    end
end
figure(7)
plot(r,rc(1,1:40),'^-',r,rc(2,1:40),'o-')
legend('ρ=0.45','ρ=0.8')
xlabel('r')
ylabel('ρc')
