function [P0]=bianshouyi(G,P0,L,r,a)
%计算收益矩阵各边的收益值，此处计算了左边的初始收益，其余各边通过矩阵的旋转得到
 for i=2:L-1
         if G(i,1)==1   %合作者
           if G(i-1,1)+G(i,2)+G(i+1,1)==-3%孤立合作者
               P0(i,1)=a-1;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==-2
               P0(i,1)=r*1/2-1;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==-1
               if G(i-1,1)==1||G(i,2)==1||G(i+1,1)==1
                   P0(i,1)=r-1;
               else P0(i,1)=r*1/3-1;
               end
          elseif G(i-1,1)+G(i,2)+G(i+1,1)==0
               if G(i-1,1)==1||G(i,2)==1||G(i+1,1)==1
                   P0(i,1)=2/3*r-1;
               else
                   P0(i,1)=1/4*r-1;
               end
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==1
               if G(i-1,1)==0||G(i,2)==0||G(i+1,1)==0
                   P0(i,1)=2/4*r-1;
               else
                   P0(i,1)=r-1;
               end
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==2
               P0(i,1)=3/4*r-1;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==3
                P0(i,1)=r-1;
           end
       elseif G(i,1)==0   %背叛者
           if G(i-1,1)+G(i,2)+G(i+1,1)==-3
               P0(i,1)=0;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==-2
               P0(i,1)=0;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==-1
                if G(i-1,1)==1||G(i,2)==1||G(i+1,1)==1
                    P0(i,1)=r*1/2;
                else
                    P0(i,1)=0;
                end
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==0
                 if G(i-1,1)==1||G(i,2)==1||G(i+1,1)==1
                     P0(i,1)=1/3*r;
                 else
                     P0(i,1)=0;
                 end
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==1
               if G(i-1,1)==0||G(i,2)==0||G(i+1,1)==0
                   P0(i,1)=1/4*r;
               else
                   P0(i,1)=2/3*r;
               end
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==2
               P0(i,1)=2/4*r;
           elseif G(i-1,1)+G(i,2)+G(i+1,1)==3
              P0(i,1)=3/4*r; 
           end
       end
   end
