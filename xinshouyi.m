function [P0]=xinshouyi(G,P0,L,r,a,u,v)
%计算选择策略后更新的收益矩阵
%(u0,v0)点确定其收益P0(u0,v0);影响到周围的2-4个点
  
if G(u,v)==-1    %孤立点的情况
          P0(u,v)=-1;
    end
    [P0]=dianshouyi(G,P0,L,r,a,u,v);    
    %判断输入点的上下左右点是角点、边点还是内点，并计算其收益值
    %上点
    if u-1>0
    [P0]=dianshouyi(G,P0,L,r,a,u-1,v);
    end
    %下点
    if u+1<=L
    [P0]=dianshouyi(G,P0,L,r,a,u+1,v);
    end
    %左点
    if v-1>0
     [P0]=dianshouyi(G,P0,L,r,a,u,v-1);
    end
    %右点
    if v+1<=L
     [P0]=dianshouyi(G,P0,L,r,a,u,v+1);
    end
