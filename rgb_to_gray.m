function [Gray_image] = rgb_to_gray(Image)
% Gray_image = rgb2gray(Image);
% a=[0.299;0.587;0.114];
% % a=double(a);
Image=double(Image);
 Gray_image=0.299*Image(:,:,1)+0.587*Image(:,:,2)+0.114*Image(:,:,3);
 Gray_image=Gray_image/255;

% % Diese Funktion soll ein RGB-Bild in ein Graustufenbild umwandeln. Falls
% das Bild bereits in Graustufen vorliegt, soll es direkt zur?kgegeben werden.

end
