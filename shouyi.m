function [P0]=shouyi(G,P0,L,r,a)
%将网络中参与者分为四类，四角，四边和内部
%先判断孤立个体和非孤立个体，再用计算规则计算初始收益矩阵P0
 %左上角
  if G(1,1)==1%合作者
      if G(1,2)==-1&&G(2,1)==-1   %孤立合作者
          P0(1,1)=a-1;   %a为较低收益，相当于σ，1<=a<=r    
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
  elseif G(1,1)==0%背叛者
      if G(1,2)==-1&&G(2,1)==-1%孤立背叛者 
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
 %右上角
  if G(1,L)==1%合作者
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
  elseif G(1,L)==0%背叛者
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
 %左下角
  if G(L,1)==1%º合作者Ï×÷Õß
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
  elseif G(L,1)==0背叛者
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
  
 %右下角
   if G(L,L)==1%合作者
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
  elseif G(L,L)==0背叛者
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
  %左边初始收益值
  [P0]=bianshouyi(G,P0,L,r,a);
   %上边初始收益
   G1=rot90(G);
   P1=rot90(P0);
   [P1]=bianshouyi(G1,P1,L,r,a); 
   %右边初始收益
   G2=rot90(G1);
   P2=rot90(P1);
   [P2]=bianshouyi(G2,P2,L,r,a);
   %下边初始收益
   G3=rot90(G2);
   P3=rot90(P2);
   [P3]=bianshouyi(G3,P3,L,r,a);
   P0=rot90(P3);
 %方格内部收益
  for i=2:L-1
      for j=2:L-1
          if G(i,j)==1%合作
              if G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-4
                  P0(i,j)=a-1;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-3 
                  P0(i,j)=1/2*r-1;
              elseif G(i,j-1)+G(i-1,j)+G(i,j+1)+G(i+1,j)==-2
                  if G(i,j-1)==0||G(i-1,j)==0||G(i,j+1)==0||G(i+1,j)==0
                      P0(i,j)=1/3*r-1;
                  elseif G(i,j-1)==1||G(i-1,j)==1||G(i,j+1)==1||G(i+1,j)==1
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
                  if G(i,j-1)~=-1&&G(i-1,j)~=-1&&G(i,j+1)~=-1&&G(i+1,j)~=-1
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
          elseif G(i,j)==0%背叛
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
      end
  end
