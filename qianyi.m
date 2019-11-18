function[P0,G]=qianyi(G,P0,L,r,a,u0,v0,rm)
%计算某点以 (2rm+1)*(2rm+1)为范围,1-w为概率迁移后的收益矩阵
                max2=-1;
                sy=P0(u0,v0);
                for u=(u0-rm):(u0+rm)
                    for v=(v0-rm):(v0+rm)
                        if u>0&&v>0&&u<=L&&v<=L
                            G1=G;
                            if G1(u,v)==-1
                                G1(u,v)=G1(u0,v0);
                                G1(u0,v0)=-1;
                                P1=P0;
                                %影响周围4-8个点
                                [P1]=xinshouyi(G1,P1,L,r,a,u0,v0);
                                [P1]=xinshouyi(G1,P1,L,r,a,u,v);
                                if max2<P1(u,v)
                                    max2=P1(u,v);
                                    p=u;q=v;
                                elseif max2==P1(u,v)
                                    f=rand;
                                    if f>0.5
                                        p=u;q=v;
                                   end
                                end
                            end
                        end
                    end
                end
                if max2<=sy
                    p=u0;
                    q=v0;
                    G(p,q)=G(u0,v0);
                else
                    G(p,q)=G(u0,v0);
                    G(u0,v0)=-1;
                    [P0]=xinshouyi(G,P0,L,r,a,u0,v0);
                    [P0]=xinshouyi(G,P0,L,r,a,p,q);
                end
