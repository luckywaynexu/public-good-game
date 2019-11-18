L=50;
T=20;
r0=linspace(0.02,1,50);
r=3;
a=1.5; 
w=0.5;
rm=2;
rs=ones(3,50);
rs(3,:)=2*ones(1,50);
rs(2,:)=ceil(2*rand(1,50));
rc=zeros(3,50);
for ci=1:50
    N=ceil(L*L*r0(ci));
    G=(-1)*ones(L,L);
    b=randperm(L*L);
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1);
    P0=G;
    G0=G;
    for z=1:3
        G=G0;
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
           [P0,G]=xuexi(G,P0,L,r,a,u0,v0,rs(z,ci));
             else
           [P0,G]=qianyi(G,P0,L,r,a,u0,v0,rm);
             end
        end    
    n1=numel(find(G==1));
    rc(z,ci)=n1/N;
    end
end
figure(1)
hold on
plot (r0,rc(2,:),'^-')
plot (r0,rc(3,:),'o-')
plot(r0,rc(1,:),'-s')
ylabel('ρc')
xlabel('ρ0')
