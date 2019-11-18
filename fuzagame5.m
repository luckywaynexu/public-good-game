L=50;
T=linspace(1,100,100);
r0=0.45;
r=3;
a=1.5; 
w=0.5;
rs=2;rm=1;
rc=zeros(1,100);
parfor ti=1:100
    N=ceil(L*L*r0);
    G=(-1)*ones(L,L);
    b=randperm(L*L);
    i=b(1:N);
    G(i)=ceil(2*rand(1,N)-1);
    P0=G;
    [P0]=shouyi(G,P0,L,r,a);  
        for t=1:T(ti)*N
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
    n1=numel(find(G==1));
    rc(ti)=n1/N;
end
figure(5)
plot (T,rc)
xlabel('t')
ylabel('ρc')
