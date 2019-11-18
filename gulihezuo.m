function gc=gulihezuo(G,L,gc)
%统计最终矩阵中孤立合作者的数目
%先考虑矩阵的四个角
  %左上角
  if G(1,1)==1%合作
      if G(1,2)==-1&&G(2,1)==-1%孤立合作者
          gc=gc+1;
      end
  end
 %右上角 
  if G(1,L)==1
      if G(1,L-1)==-1&&G(2,L)==-1
          gc=gc+1;
      end
  end
 %左下角
  if G(L,1)==1
      if G(L,2)==-1&&G(L-1,1)==-1
          gc=gc+1;
      end
  end
 %右下角 
   if G(L,L)==1
      if G(L,L-1)==-1&&G(L-1,L)==-1
          gc=gc+1;
      end
   end
   %考虑矩阵的边
   for i=2:L-1
       if G(i,1)==1%左边
           if G(i-1,1)+G(i,2)+G(i+1,1)==-3
               gc=gc+1;
           end
       elseif G(i,L)==1%右边
           if G(i-1,L)+G(i,L-1)+G(i+1,L)==-3
               gc=gc+1;
           end
       end
   end
   for j=2:L-1
       if G(1,j)==1%上边
           if G(1,j-1)+G(2,j)+G(1,j+1)==-3
               gc=gc+1;
           end
       elseif G(L,j)==1%下边
           if G(L,j-1)+G(L-1,j)+G(L,j+1)==-3
               gc=gc+1;
           end
       end
   end
  %考虑矩阵内部
  for i=2:L-1
      for j=2:L-1
          if G(i,j)==1
              if G(i,j-1)+G(i-1,j)+G(i+1,j)+G(i,j+1)==-4
                  gc=gc+1;
              end
          end
      end
  end
end
