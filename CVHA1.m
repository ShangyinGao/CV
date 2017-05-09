%  Gruppennummer:
%  Gruppenmitglieder:

%% Hausaufgabe 1
%  Einlesen und Konvertieren von Bildern sowie Bestimmung von 
%  Merkmalen mittels Harris-Detektor. 

%  F? die letztendliche Abgabe bitte die Kommentare in den folgenden Zeilen
%  enfernen und sicherstellen, dass alle optionalen Parameter ?er den
%  entsprechenden Funktionsaufruf fun('var',value) modifiziert werden k?nen.


%% Bild laden
  Image = imread('szene.jpg');
   IGray = rgb_to_gray(Image);
  

 [Fx,Fy] = sobel_xy(IGray);
  figure(1)
 imshow(IGray);
 figure(2)
  imshow(Fx);
 figure(3)
 imshow(Fy);
% imshow(IGray);
% I=detectHarrisFeatures(IGray);
% plot(I.selectStrongest(1000));
% 
% 
%% Harris-Merkmale berechnen
%    tic;
%   Merkmale = harris_detektor(IGray);%,'do_plot',true);
% %    [rown,coln]= harris_detektor(IGray);
%    toc;
