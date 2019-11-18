function[P0]=dianshouyi(G,P0,L,r,a,u,v)
%计算某点的收益值
%点（u,v）改变策略后，收益矩阵更新
%先判断是角点、边点，还是内点
%角点
if (u==1&&v==1)||(u==1&&v==L)||(u==L&&v==1)||(u==L&&v==L)
    %左上角
    if u==1&&v==1
        if G(1,1)==1   %合作者
            if G(1,2)==-1&&G(2,1)==-1   %孤立合作者
                P0(1,1)=a-1;    
            elseif G(1,2)+G(2,1)==-1   %非孤立合作者
                P0(1,1)=r*1/2-1;
            elseif G(1,2)+G(2,1)==0   
                if G(1,2)==-1||G(2,1)==-1
                    P0(1,1)=r-1;
                else
                    P0(1,1)=(r*1/3)-1;
                end
            elseif G(1,2)+G(2,1)==1
                P0(1,1)=(r*2/3)-1;
            elseif G(1,2)+G(2,1)==2
                P0(1,1)=r-1;
            end
        elseif G(1,1)==0   %背叛者
            if G(1,2)==-1&&G(2,1)==-1   %孤立背叛者
                P0(1,1)=0;
            elseif G(1,2)+G(2,1)==-1    %非孤立背叛者
                P0(1,1)=0;
            elseif G(1,2)+G(2,1)==0
                if G(1,2)==-1||G(2,1)==-1
                    P0(1,1)=r*1/2;
                else
                    P0(1,1)=0;
                end
            elseif G(1,2)+G(2,1)==1
                P0(1,1)=(r*1/3);
            elseif G(1,2)+G(2,1)==2
                P0(1,1)=r*2/3;
            end
        end
    end
    %右上角
    if u==1&&v==L
        if G(1,L)==1   %合作者
            if G(1,L-1)==-1&&G(2,L)==-1   
                P0(1,L)=a-1;  
            elseif G(1,L-1)+G(2,L)==-1  
                P0(1,L)=r*1/2-1;
            elseif G(1,L-1)+G(2,L)==0
                if G(1,L-1)==-1||G(2,L)==-1
                    P0(1,L)=r-1;
                else
                P0(1,L)=(r*1/3)-1;
                end
            elseif G(1,L-1)+G(2,L)==1
                P0(1,L)=(r*2/3)-1;
            elseif G(1,L-1)+G(2,L)==2
                P0(1,L)=r-1;
            end
        elseif G(1,L)==0    %背叛者
            if G(1,L-1)==-1&&G(2,L)==-1  
                P0(1,L)=0;
            elseif G(1,L-1)+G(2,L)==-1    
                P0(1,L)=0;
            elseif G(1,L-1)+G(2,L)==0
                if G(1,L-1)==-1||G(2,L)==-1
                    P0(1,L)=r*1/2;
                else
                P0(1,L)=0;
                end
            elseif G(1,L-1)+G(2,L)==1
                P0(1,L)=(r*1/3);
            elseif G(1,L-1)+G(2,L)==2
                P0(1,L)=r*2/3;
            end
        end
    end
    %左下角
    if u==L&&v==1
        if G(L,1)==1   %合作者
            if G(L,2)==-1&&G(L-1,1)==-1   
                P0(L,1)=a-1;
            elseif G(L,2)+G(L-1,1)==-1   
                P0(L,1)=r*1/2-1;
            elseif G(L,2)+G(L-1,1)==0
                if G(L,2)==-1||G(L-1,1)==-1
                    P0(L,1)=r-1;
                else
                P0(L,1)=(r*1/3)-1;
                end
            elseif  G(L,2)+G(L-1,1)==1
                P0(L,1)=(r*2/3)-1;
            elseif  G(L,2)+G(L-1,1)==2
                P0(L,1)=r-1;
            end
        elseif G(L,1)==0%背叛者
            if  G(L,2)==-1&&G(L-1,1)==-1
                P0(L,1)=0;
            elseif G(L,2)+G(L-1,1)==-1   
                P0(L,1)=0;  
            elseif  G(L,2)+G(L-1,1)==0
                if  G(L,2)==-1||G(L-1,1)==-1
                    P0(L,1)=r*1/2;
                else
                P0(L,1)=0;
                end
            elseif  G(L,2)+G(L-1,1)==1
                P0(L,1)=(r*1/3);
            elseif  G(L,2)+G(L-1,1)==2  
                P0(L,1)=r*2/3;
            end
        end
    end
    %右下角
    if u==L&&v==L 
        if G(L,L)==1   %合作者
            if G(L,L-1)==-1&&G(L-1,L)==-1  
                P0(L,L)=a-1;   
            elseif G(L,L-1)+G(L-1,L)==-1  
                P0(L,L)=r*1/2-1;
            elseif G(L,L-1)+G(L-1,L)==0
                if G(L,L-1)==-1||G(L-1,L)==-1
                    P0(L,L)=r-1;
                else
                P0(L,L)=(r*1/3)-1;
                end
            elseif G(L,L-1)+G(L-1,L)==1
                P0(L,L)=(r*2/3)-1;
            elseif G(L,L-1)+G(L-1,L)==2
                P0(L,L)=r-1;
            end
        elseif G(L,L)==0%背叛者
            if G(L,L-1)==-1&&G(L-1,L)==-1
                P0(L,L)=0;
            elseif G(L,L-1)+G(L-1,L)==-1
                P0(L,L)=0;
            elseif G(L,L-1)+G(L-1,L)==0
                if G(L,L-1)==-1||G(L-1,L)==-1
                    P0(L,L)=r*1/2;
                else
                P0(L,L)=0;
                end
            elseif G(L,L-1)+G(L-1,L)==1
                P0(L,L)=(r*1/3);
            elseif G(L,L-1)+G(L-1,L)==2
                P0(L,L)=r*2/3;
            end
        end
    end
%内点
elseif u>1&&u<L&&v>1&&v<L
      i=u;
      j=v;
        if G(i,j)==1%合作
              if G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-4
                  P0(i,j)=a-1;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-3 
                  P0(i,j)=1/2*r-1;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-2
                  if G(i,j-1)==0||G(i-1,j)==0||G(i,j+1)==0||G(i+1,j)==0
                      P0(i,j)=1/3*r-1;
                  elseif
G(i,j-1)==1||G(i-1,j)==1||G(i,j+1)==1||G(i+1,j)==1
                      P0(i,j)=r-1;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-1
                  if G(i,j-1)~=1&&G(i-1,j)~=1&&G(i,j+1)~=1&&G(i+1,j)~=1
                     P0(i,j)=1/4*r-1;
                  else P0(i,j)=2/3*r-1;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==0
                   if G(i,j-1)~=0&&G(i-1,j)~=0&&G(i,j+1)~=0&&G(i+1,j)~=0
                       P0(i,j)=r-1;
                   elseif G(i,j-1)==0&&G(i-1,j)==0&&G(i,j+1)==0&&G(i+1,j)==0
                       P0(i,j)=1/5*r-1;
                   else P0(i,j)=2/4*r-1;
                   end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==1
                  if  G(i,j-1)~=-1&&G(i-1,j)~=-1&&G(i,j+1)~=-1&&G(i+1,j)~=-1
                     P0(i,j)=2/5*r-1;
                  else P0(i,j)=3/4*r-1;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==2
                  if G(i,j-1)~=-1&&G(i-1,j)~=-1&&G(i,j+1)~=-1&&G(i+1,j)~=-1
                      P0(i,j)=3/5*r-1;
                  else P0(i,j)=r-1;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==3
                  P0(i,j)=4/5*r-1;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==4
                  P0(i,j)=r-1;
              end
          elseif G(i,j)==0%背叛者
              if G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-4
                  P0(i,j)=0;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-3
                  P0(i,j)=0;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-2
                   if G(i,j-1)==0||G(i-1,j)==0||G(i,j+1)==0||G(i+1,j)==0
                      P0(i,j)=0;
                  elseif G(i,j-1)==1||G(i-1,j)==1||G(i,j+1)==1||G(i+1,j)==1
                      P0(i,j)=1/2*r;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-1
                  if G(i,j-1)~=1&&G(i-1,j)~=1&&G(i,j+1)~=1&&G(i+1,j)~=1
                     P0(i,j)=0;
                  else P0(i,j)=1/3*r;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==0
                   if G(i,j-1)~=0&&G(i-1,j)~=0&&G(i,j+1)~=0&&G(i+1,j)~=0
                       P0(i,j)=2/3*r;
                   elseif G(i,j-1)==0&&G(i-1,j)==0&&G(i,j+1)==0&&G(i+1,j)==0
                       P0(i,j)=0;
                   else P0(i,j)=1/4*r;
                   end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==1
                   if G(i,j-1)~=-1&&G(i-1,j)~=-1&&G(i,j+1)~=-1&&G(i+1,j)~=-1
                     P0(i,j)=1/5*r;
                  else P0(i,j)=2/4*r;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==2
                  if G(i,j-1)~=-1&&G(i-1,j)~=-1&&G(i,j+1)~=-1&&G(i+1,j)~=-1
                      P0(i,j)=2/5*r;
                  else P0(i,j)=3/4*r;
                  end
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==3
                  P0(i,j)=3/5*r;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==4
                  P0(i,j)=4/5*r;
              end
          end
%边点
else 
    %左边
    if v==1&&(u>1&&u<L)
        i=u;
     if G(i,1)==1   %合作者
           if G(i-1,1)+G(i,2)+G(i+1,1)==-3
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
    %上边
    if u==1&&(v>1&&v<L)
        i=v;
        if G(1,i)==1   %合作者
           if G(1,i-1)+G(2,i)+G(1,i+1)==-3   
               P0(1,i)=a-1;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==-2
               P0(1,i)=r*1/2-1;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==-1
               if G(1,i-1)==1||G(2,i)==1||G(1,i+1)==1
                   P0(1,i)=r-1;
               else P0(1,i)=r*1/3-1;
               end
          elseif G(1,i-1)+G(2,i)+G(1,i+1)==0
               if G(1,i-1)==1||G(2,i)==1||G(1,i+1)==1
                   P0(1,i)=2/3*r-1;
               else
                   P0(1,i)=1/4*r-1;
               end
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==1
               if  G(1,i-1)==0||G(2,i)==0||G(1,i+1)==0
                   P0(1,i)=2/4*r-1;
              else
                   P0(1,i)=r-1;
               end
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==2
               P0(1,i)=3/4*r-1;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==3
                P0(1,i)=r-1;
           end
       elseif G(1,i)==0   %背叛者
           if G(1,i-1)+G(2,i)+G(1,i+1)==-3
              P0(1,i)=0;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==-2
               P0(1,i)=0;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==-1
                if  G(1,i-1)==1||G(2,i)==1||G(1,i+1)==1
                    P0(1,i)=r*1/2;
                else
                    P0(1,i)=0;
                end
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==0
                 if  G(1,i-1)==1||G(2,i)==1||G(1,i+1)==1
                   P0(1,i)=1/3*r;
                 else
                     P0(1,i)=0;
                 end
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==1
               if G(1,i-1)==0||G(2,i)==0||G(1,i+1)==0
                   P0(1,i)=1/4*r;
               else
                   P0(1,i)=2/3*r;
               end
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==2
               P0(1,i)=2/4*r;
           elseif G(1,i-1)+G(2,i)+G(1,i+1)==3
              P0(1,i)=3/4*r; 
           end
        end
    end
    %下边
    if u==L&&(v>1&&v<L)
       i=v;
     if G(L,i)==1   %合作者
           if G(L,i-1)+G(L-1,i)+G(L,i+1)==-3  
               P0(L,i)=a-1;
           elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==-2
                P0(L,i)=r*1/2-1;
           elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==-1
               if G(L,i-1)==1||G(L-1,i)==1||G(L,i+1)==1
                   P0(L,i)=r-1;
               else
                   P0(L,i)=r*1/3-1;
               end
          elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==0
               if G(L,i-1)==1||G(L-1,i)==1||G(L,i+1)==1
                   P0(L,i)=2/3*r-1;
               else
                   P0(L,i)=1/4*r-1;
               end
           elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==1
               if G(L,i-1)==0||G(L-1,i)==0||G(L,i+1)==0
                       P0(L,i)=2/4*r-1;
                   else
                       P0(L,i)=r-1;
               end
           elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==2
               P0(L,i)=3/4*r-1;
           elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==3
                 P0(L,i)=r-1;
           end
     elseif G(L,i)==0    %背叛者
         if G(L,i-1)+G(L-1,i)+G(L,i+1)==-3   
             P0(L,i)=0;
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==-2
             P0(L,i)=0;
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==-1
             if G(L,i-1)==1||G(L-1,i)==1||G(L,i+1)==1
                 P0(L,i)=r*1/2;
             else
                 P0(L,i)=0;
             end
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==0
             if G(L,i-1)==1||G(L-1,i)==1||G(L,i+1)==1
                 P0(L,i)=1/3*r;
             else
                 P0(L,i)=0;
             end
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==1
             if G(L,i-1)==0||G(L-1,i)==0||G(L,i+1)==0
                 P0(L,i)=1/4*r;
             else
                 P0(L,i)=2/3*r;
             end
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==2
             P0(L,i)=2/4*r;
         elseif G(L,i-1)+G(L-1,i)+G(L,i+1)==3
             P0(L,i)=3/4*r; 
         end
     end
    end
    %右边
    if v==L&&(u>1&&u<L)
        i=u;
        if G(i,L)==1    %合作者
           if G(i-1,L)+G(i,L-1)+G(i+1,L)==-3   
               P0(i,L)=a-1;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==-2
               P0(i,L)=r*1/2-1;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==-1
               if G(i-1,L)==1||G(i,L-1)==1||G(i+1,L)==1
                   P0(i,L)=r-1;
               else
                   P0(i,L)=r*1/3-1;
               end
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==0
               if G(i-1,L)==1||G(i,L-1)==1||G(i+1,L)==1
                   P0(i,L)=2/3*r-1;
               else
                   P0(i,L)=1/4*r-1;
               end
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==1
               if G(i-1,L)==0||G(i,L-1)==0||G(i+1,L)==0
                   P0(i,L)=2/4*r-1;
               else
                   P0(i,L)=r-1;
               end
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==2
               P0(i,L)=3/4*r-1;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==3
                P0(i,L)=r-1;
           end
       elseif G(i,L)==0   %背叛者
           if G(i-1,L)+G(i,L-1)+G(i+1,L)==-3  
              P0(i,L)=0;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==-2
              P0(i,L)=0;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==-1
                if G(i-1,L)==1||G(i,L-1)==1||G(i+1,L)==1
                    P0(i,L)=r*1/2;
                else
                    P0(i,L)=0;
                end
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==0
                 if G(i-1,L)==1||G(i,L-1)==1||G(i+1,L)==1
                     P0(i,L)=1/3*r;
                 else
                     P0(i,L)=0;
                 end   
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==1
               if G(i-1,L)==0||G(i,L-1)==0||G(i+1,L)==0
                   P0(i,L)=1/4*r;
               else
                   P0(i,L)=2/3*r;
               end
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==2
               P0(i,L)=2/4*r;
           elseif G(i-1,L)+G(i,L-1)+G(i+1,L)==3
               P0(i,L)=3/4*r; 
           end
        end
    end 
end
