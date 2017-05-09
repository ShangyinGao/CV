function [Fx,Fy] = sobel_xy(Image)
% In dieser Funktion soll das Sobel-Filter implementiert werden, welches
% ein Graustufenbild einliest und den Bildgradienten in x- sowie in
% y-Richtung zur?kgibt.
%  sobel_x=[1,2,1;0,0,0;-1,-2,-1];
% sobel_y=sobel_x';
%  [x,y]=size(Image);
%  for i=2:1:x-1
%     for j=2:1:y-1
%          Image(i-1:i+1,j-1:j+1)=Image(i-1:i+1,j-1:j+1)*sobel_y;
%     end
%  end
sobel_y=[1,2,1;0,0,0;-1,-2,-1];
sobel_x=sobel_y';
Fx=conv2(Image,sobel_x,'same');
Fy=conv2(Image,sobel_y,'same');


end






