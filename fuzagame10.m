L=50;
T=10;
r0=linspace(0.02,1,50);
r=3;
a=1.5; 
w=[0,0.2,0.5,0.8,1.0];
rs=1;rm=2;
rc=zeros(5,50);
parfor ci=1:50
    N=ceil(L*L*r0(ci));
    G=(-1)*ones(L,L);
    b=randperm(L*L);
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1);
    G0=G;
    for z=1:5
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
            if y<=w(z)
                [P0,G]=xuexi(G,P0,L,r,a,u0,v0,rs);
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
plot(r0,rc(1,:),'-cd');
plot(r0,rc(2,:),'-bv');
plot(r0,rc(3,:),'-go');
plot(r0,rc(4,:),'-r^');
plot(r0,rc(5,:),'-s');
legend('w=0.0','w=0.2','w=0.5','w=0.8','w=1.0');
xlabel('ρ0')
ylabel('ρc')
