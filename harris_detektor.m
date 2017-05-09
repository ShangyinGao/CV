function [Merkmale] = harris_detektor(Image)
%varargin) 
% In dieser Funktion soll der Harris-Detektor implementiert werden, der
% Merkmalspunkte aus dem Bild extrahiert
%正常的harris detector


k=0.05;
sigma=1;
segment_length=3;
[a,b]=size(Image);
min_dist=100;%距离的平房
 tau=0.1;     %tau值
[Fx,Fy]=sobel_xy(Image);
tile_size=[200,300];
N=1;
kx=fix(a/tile_size(1,1));
ky=fix(b/tile_size(1,2));
% taum=zeros(a/tile_size(1,1),b/tile_size(1,2));
%Abstand=10000;
% % G=[(Fx*Fx'),Fx*Fy';Fy*Fx',(Fy*Fy')];
% 
% G=[(Fx.*Fx),Fx.*Fy;Fy.*Fx,(Fy.*Fy)];
%  [x,y]=size(G);
%  H=zeros(x-1,y-1);
%  for i= 1:1:x-1
%      for j=1:1:y-1
%          g=G(i:(i+segment_length-1),j:(j+segment_length-1));
%          H(i,j)=det(g)-k*(trace(g))^2;
%      end
%  end
g=fspecial('gaussian',max(1,fix(6*sigma)),sigma);
Fx2=conv2(Fx.*Fx,g,'same');
Fy2=conv2(Fy.*Fy,g,'same');
Fxy=conv2(Fx.*Fy,g,'same');
 H=(Fx2.*Fy2-Fxy.^2)-k*(Fx2+Fy2).^2;
%H=(Fx2.*Fy2-Fxy.^2)./(Fx2+Fy2+eps);
mx=ordfilt2(H,segment_length^2,ones(segment_length));
 [rows,cols]=find((H==mx)&(H>tau));
 Merkmale=[rows,cols];
 
  figure(1),imshow(Image),hold on,
   plot(cols,rows,'ys')


 
 % 设置两个conner的最小距离
 b=length(Merkmale);

 for i=1:b-1
       for j=i+1:b
           if ((Merkmale(i,1)-Merkmale(j,1))^2+ (Merkmale(i,2)-Merkmale(j,2))^2)<min_dist
             % Merkmale(i,1)=ceil((Merkmale(i,1)+Merkmale(j,1))/2);
             % Merkmale(j,1)=ceil((Merkmale(i,1)+Merkmale(j,1))/2);
             Merkmale(j,1)=Merkmale(i,1);
%                Merkmale(i,2)=ceil((Merkmale(i,2)+Merkmale(j,2))/2);
%                Merkmale(j,2)=ceil((Merkmale(i,2)+Merkmale(j,2))/2); 
             Merkmale(j,2)=Merkmale(i,2);
           end
      end
  end
 

   Merkmale=unique(Merkmale,'rows');
    rown=(Merkmale(:,1));
    coln=(Merkmale(:,2));
% % %
% % 

    figure(2),imshow(Image),hold on,
   plot(coln,rown,'ys')
%   以200*300为小图形建立每个图不超过 N个的harris detector        
  c=length(Merkmale);
  H1=zeros(size(H));
  for i=1:c
     H1(Merkmale(i,1),Merkmale(i,2))=H(Merkmale(i,1),Merkmale(i,2));
  end
  
   
  test=zeros(200,300);
  for i=1:tile_size(1,1):kx*tile_size(1,1)
       for j= 1:tile_size(1,2):ky*tile_size(1,2)
          test(1:tile_size(1,1),1:tile_size(1,2))=H1(i:(i+tile_size(1,1)-1),j:(j+tile_size(1,2)-1));
           sum=0;
          for k= 1:c
              if ((i<=Merkmale(k,1))&&(Merkmale(k,1)<=(i+tile_size(1,1)))&&((j<=Merkmale(k,2))&&(Merkmale(k,2)<=(j+tile_size(1,2)))))
                  
                  sum=sum+1;
              end
          end
          if sum > N
             [aaa]=sort(test(:));
             T=aaa(end-N,1);
             test(test<T)=0;
             
             H1(i:(i+tile_size(1,1)-1),j:(j+tile_size(1,2)-1))=test(1:tile_size(1,1),1:tile_size(1,2));
            
          end
         
            
            
        end
  end
   [rowm,colm]=find((H1~=0));
   Merkmale=[rowm,colm];
 
   figure(3),imshow(Image),hold on,
  plot(colm,rowm,'ys')


end