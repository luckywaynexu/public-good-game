L=50;
T=10;
r0=linspace(0.02,1,50);
r=3;
a=1.5; 
w=0.5;
rs=1;rm=2;
rc=zeros(1,50);
ri=zeros(1,50);
for ci=1:50
   
    N=ceil(L*L*r0(ci));
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
    n1=numel(find(G==1));
    %博弈合作者的相对比例
    rc(ci)=n1/N;
    gc=0;%gc表示孤立合作者的数目
    gc=gulihezuo(G,L,gc);
    ri(ci)=gc/(L*L);%孤立合作者的绝对比列
end
figure(2)
subplot(2,1,1);
plot (r0,rc,'^-')
legend('ρc')
xlabel('ρ0')
ylabel('fraction of cooperator')
subplot(2,1,2);
plot (r0,ri,'o-')
xlabel('ρ0')
ylabel('ρi')

