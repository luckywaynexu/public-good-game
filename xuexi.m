function[P0,G]=xuexi(G,P0,L,r,a,u0,v0,rs)
%计算某点以 (2rs+1)*(2rs+1)为范围,w为概率学习后的收益矩阵
             max=P0(u0,v0);
                for u=(u0-rs):(u0+rs)
                    for v=(v0-rs):(v0+rs)
                        if u>0&&v>0 &&u<=L&&v<=L
                            if max<P0(u,v)%遇到比自己收益大的点即向此点学习
max=P0(u,v);
                                G(u0,v0)=G(u,v);
                          elseif max==P0(u,v) 
%遇到和自己一样大的，以0.5的概率选择是否向此点学习
                                f=rand;
                                if f>0.5
                                    G(u0,v0)=G(u,v);
                                end
                            end
                        end
                    end
                end
                %计算选择策略后更新的收益矩阵
               [P0]=xinshouyi(G,P0,L,r,a,u0,v0);  
