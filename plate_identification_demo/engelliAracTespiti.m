clc; clear all;
clear all;clc;

BACKGROUND=imread('/home/seray/Desktop/bitirmeProjesi/1_1.png');
arkaplan=BACKGROUND;
IMAGE=imread('/home/seray/Desktop/bitirmeProjesi/2_2.png');
ResimOrjinal0=IMAGE;
%IMAGE=imresize(IMAGE,0.1);
%size(IMAGE)
%figure,imshow(arkaplan);
%BACKGROUND=imresize(BACKGROUND,0.1);
%size(BACKGROUND)
% *************** ARKA PLANI TANI *************************************
% Arka plan taninarak uzerine konan cisimler arka plandan cikartilarak
% zemini temizledim, butun arkaplana ait olan pikselleri beyaz yaptim
% *********************************************************************
fark=BACKGROUND-IMAGE;
%figure,imshow(fark)
red = IMAGE(:,:,1);
green = IMAGE(:,:,2);
blue = IMAGE(:,:,3);

[r c COLORMAP] = size(IMAGE);

redFark = fark(:,:,1);
greenFark = fark(:,:,2);
blueFark = fark(:,:,3);

%%video1 arkaplanlar <35
%%video2 arkaplanlar <45
for i=1:r
    for j=1:c
        
        if(redFark(i,j,1)<45 && greenFark(i,j,1)<45 && blueFark(i,j,1)<45)
            redFark(i,j,1)=255;
            greenFark(i,j,1)=255;
            blueFark(i,j,1)=255;
            
        else
            redFark(i,j,1)=red(i,j,1);
            greenFark(i,j,1)=green(i,j,1);
            blueFark(i,j,1)=blue(i,j,1);
        end
        
    end
    
end

cleanIMAGE = cat(3, redFark, greenFark, blueFark);
%kullanilmaya hazir goruntu
%imwrite(cleanIMAGE,'/home/seray/Desktop/cleanIMAGE.png');
%figure(1234),imshow(cleanIMAGE);

bw1 = im2bw(BACKGROUND, graythresh(BACKGROUND));
bw2 = im2bw(IMAGE, graythresh(IMAGE));
fark=bw1-bw2;



%%video1 arkaplanlar <35
%%video2 arkaplanlar <45
for i=1:r
    for j=1:c
        
        if(redFark(i,j,1)<45 && greenFark(i,j,1)<45 && blueFark(i,j,1)<45)
        
             redFark(i,j,1)=red(i,j,1);
            greenFark(i,j,1)=green(i,j,1);
            blueFark(i,j,1)=blue(i,j,1);
            
        else
                redFark(i,j,1)=255;
            greenFark(i,j,1)=255;
            blueFark(i,j,1)=255;
            
         
        end
        
    end
    
end


cleanIMAGE = cat(3, redFark, greenFark, blueFark);
bw2 = im2bw(cleanIMAGE, graythresh(cleanIMAGE));
%bw2 = imfill(bw2,'holes');

 for i=1:r
    for j=1:c
        if(bw2(i,j)==0)
            bw2(i,j)=1;
            
        else
            bw2(i,j)=0;
            
        end
    end
end
se = strel('disk',2);
bw2 = imclose(bw2,se);
 bw2=bwareaopen(bw2,800);

se = strel('disk',10);
bw2 = imclose(bw2,se);
 


figure(9990);

subplot(2,2,1);

imshow(arkaplan),title('ARKA PLANI TANI');



subplot(2,2,2);

imshow(ResimOrjinal0),title('ORJINAL GORUNTUl');




subplot(2,2,3);


        imshow(ResimOrjinal0),title('ARAC TESPITI');
        
    st = regionprops(bw2, 'BoundingBox');
   
    x=st.BoundingBox(3);
    y=st.BoundingBox(4);

rectangle('Position',[st.BoundingBox(1),st.BoundingBox(2),st.BoundingBox(3),st.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2)




%IMAGE=imread('/home/seray/Desktop/arac1.jpg');
IMAGE=imread('/home/seray/Desktop/bitirmeProjesi/araba.png');

mavi=imread('/home/seray/Desktop/bitirmeProjesi/mavi22.png');

red = IMAGE(:,:,1);
green = IMAGE(:,:,2);
blue = IMAGE(:,:,3);

[r c COLORMAP] = size(IMAGE);


for i=1:r
    for j=1:c
        if(red(i,j,1)<90 &&  green(i,j,1)<90 && blue(i,j,1)>90)
            red(i,j,1)=40;
            green(i,j,1)=40;
            blue(i,j,1)=40;
        else
            red(i,j,1)=255;
            green(i,j,1)=255;
            blue(i,j,1)=255;
            
        end
        
       
        
    end
    
end

cleanIMAGE = cat(3, red, green, blue);

figure(1);

subplot(2,1,1);
imshow(IMAGE),title('Engelli Arac Tespiti');


bw2 = im2bw(cleanIMAGE, graythresh(cleanIMAGE));
%bw2 = imfill(bw2,'holes');

 for i=1:r
    for j=1:c
        if(bw2(i,j)==0)
            bw2(i,j)=1;
            
        else
            bw2(i,j)=0;
            
        end
    end
 end
figure(234432),imshow(bw2),title('Etiket Tespiti');

se = strel('disk',2);
bw2 = imclose(bw2,se);
 bw2=bwareaopen(bw2,200);

 subplot(2,1,2);


        imshow(IMAGE),title('ENGELLI ETIKET TESPITI');
        
    st = regionprops(bw2, 'BoundingBox');
   
    x=st.BoundingBox(3);
    y=st.BoundingBox(4);

rectangle('Position',[st.BoundingBox(1),st.BoundingBox(2),st.BoundingBox(3),st.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2)


%kullanilmaya hazir goruntu



bw = im2bw(cleanIMAGE, graythresh(cleanIMAGE));
bwMavi =  im2bw(mavi, graythresh(mavi));
[r c ] = size(bwMavi);
for i=1:r
    for j=1:c
        if(bwMavi(i,j)==0)
            bwMavi(i,j)=1;
            
        else
            bwMavi(i,j)=0;
            
        end
    end
end
%figure(3),imshow(bw),title('Siyah Beyaz 1 Etiket');

[r c ] = size(bw);
for i=1:r
    for j=1:c
        if(bw(i,j)==0)
            bw(i,j)=1;
            
        else
            bw(i,j)=0;
            
        end
    end
end
%figure(4),imshow(bw),title('Siyah Beyaz 2 Etiket');

bw2 = imfill(bw,'holes');
%figure(5),imshow(bw2),title('Siyah Beyaz 3 Etiket');

bw2=bwareaopen(bw2,1200);
bw2=bw2-bwareaopen(bw2,1500);
%figure(6),imshow(bw2),title('Siyah Beyaz 4 Etiket');
%figure(7),imshow(bwMavi),title('Siyah Beyaz Mavi Etiket');

ResimOrjinal=imread('/home/seray/Desktop/bitirmeProjesi/araba2.jpeg');
ResimOrjinal1=ResimOrjinal;
ResimOrjinal = im2bw(ResimOrjinal, graythresh(ResimOrjinal));

logFiltresi=edge(ResimOrjinal,'log');
cannyFiltresi=edge(ResimOrjinal,'canny');
robertsFiltresi=edge(ResimOrjinal,'roberts');
prewittFiltresi=edge(ResimOrjinal,'prewitt');
sobelFiltresi=edge(ResimOrjinal,'sobel');
hLaplaceFiltresi=fspecial('laplacian');

laplaceFiltresi=imfilter(ResimOrjinal,hLaplaceFiltresi,'replicate');
figure(14554);
subplot(3,3,2);
imshow(ResimOrjinal);
title('Resmin Orjinal Hali');
subplot(3,3,4);
imshow(logFiltresi);
title('1.Log Filtresi');
subplot(3,3,5);
imshow(cannyFiltresi);
title('2.Canny Filtresi');
subplot(3,3,6);
imshow(robertsFiltresi);
title('3.Roberts Filtresi');
subplot(3,3,7);
imshow(prewittFiltresi);
title('4.Prewitt Filtresi');
subplot(3,3,8);
imshow(sobelFiltresi);
title('5.Sobel Filtresi');
subplot(3,3,9);
imshow(laplaceFiltresi);
title('6.Laplace Filtresi');


bw2 = imfill(sobelFiltresi,'holes');
se = strel('line',2,2);
bw2 = imclose(bw2,se);
%figure(2),imshow(bw2);
se = strel('disk',3);
bw2 = imclose(bw2,se);
bw2 = imfill(bw2,'holes');
bw2=bwareaopen(bw2,1000);
bw2=bw2-bwareaopen(bw2,9000);
%figure(3),imshow(bw2);



figure(9997);
subplot(2,2,1);
        imshow(ResimOrjinal1),title('Plakanin Yer Tespiti');;
        
    st = regionprops(bw2, 'BoundingBox');
   
    x=st.BoundingBox(3);
    y=st.BoundingBox(4);

rectangle('Position',[st.BoundingBox(1),st.BoundingBox(2),st.BoundingBox(3),st.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2 )


ResimOrjinal2=imread('/home/seray/Desktop/bitirmeProjesi/arac2.jpg');
ResimOrjinal=ResimOrjinal2;

ResimOrjinal = im2bw(ResimOrjinal, graythresh(ResimOrjinal));
logFiltresi=edge(ResimOrjinal,'log');
cannyFiltresi=edge(ResimOrjinal,'canny');
robertsFiltresi=edge(ResimOrjinal,'roberts');
prewittFiltresi=edge(ResimOrjinal,'prewitt');
sobelFiltresi=edge(ResimOrjinal,'sobel');
hLaplaceFiltresi=fspecial('laplacian');

laplaceFiltresi=imfilter(ResimOrjinal,hLaplaceFiltresi,'replicate');
%figure(4);
%figure(1);
%subplot(3,3,2);
%imshow(ResimOrjinal);
%title('Resmin Orjinal Hali');
%subplot(3,3,4);
%imshow(logFiltresi);
%title('1.Log Filtresi');
%subplot(3,3,5);
%imshow(cannyFiltresi);
%title('2.Canny Filtresi');
%subplot(3,3,6);
%imshow(robertsFiltresi);
%title('3.Roberts Filtresi');
%subplot(3,3,7);
%imshow(prewittFiltresi);
%title('4.Prewitt Filtresi');
%subplot(3,3,8);
%imshow(sobelFiltresi);
%title('5.Sobel Filtresi');
%subplot(3,3,9);
%imshow(laplaceFiltresi);
%title('6.Laplace Filtresi');;

bw2 = imfill(sobelFiltresi,'holes');
se = strel('line',2,2);
bw2 = imclose(bw2,se);
%figure(5),imshow(bw2);


bw2=bwareaopen(bw2,9000);
bw2=bw2-bwareaopen(bw2,32000);

%figure(6),imshow(bw2);
bw2 = imfill(bw2,'holes');


%figure(9999);
subplot(2,2,2);
        imshow(ResimOrjinal2),title('Plakanin Yer Tespiti');;
        
    st = regionprops(bw2, 'BoundingBox');
    x=st.BoundingBox(3);
    y=st.BoundingBox(4);

 rectangle('Position',[st.BoundingBox(1),st.BoundingBox(2),st.BoundingBox(3),st.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2 )

ResimOrjinal3=imread('/home/seray/Desktop/bitirmeProjesi/arac1.jpg');
ResimOrjinal=ResimOrjinal3;

ResimOrjinal = im2bw(ResimOrjinal, graythresh(ResimOrjinal));
logFiltresi=edge(ResimOrjinal,'log');
cannyFiltresi=edge(ResimOrjinal,'canny');
robertsFiltresi=edge(ResimOrjinal,'roberts');
prewittFiltresi=edge(ResimOrjinal,'prewitt');
sobelFiltresi=edge(ResimOrjinal,'sobel');
hLaplaceFiltresi=fspecial('laplacian');

laplaceFiltresi=imfilter(ResimOrjinal,hLaplaceFiltresi,'replicate');
%figure(4);
%figure(1);
%subplot(3,3,2);
%imshow(ResimOrjinal);
%title('Resmin Orjinal Hali');
%subplot(3,3,4);
%imshow(logFiltresi);
%title('1.Log Filtresi');
%subplot(3,3,5);
%imshow(cannyFiltresi);
%title('2.Canny Filtresi');
%subplot(3,3,6);
%imshow(robertsFiltresi);
%title('3.Roberts Filtresi');
%subplot(3,3,7);
%imshow(prewittFiltresi);
%title('4.Prewitt Filtresi');
%subplot(3,3,8);
%imshow(sobelFiltresi);
%title('5.Sobel Filtresi');
%subplot(3,3,9);
%imshow(laplaceFiltresi);
%title('6.Laplace Filtresi');;

bw2 = imfill(sobelFiltresi,'holes');
se = strel('line',2,2);
bw2 = imclose(bw2,se);
%figure(5),imshow(bw2);


bw2=bwareaopen(bw2,9000);
bw2=bw2-bwareaopen(bw2,32000);

%figure(6),imshow(bw2);
bw2 = imfill(bw2,'holes');


%figure(9998);
subplot(2,2,3);
        imshow(ResimOrjinal3),title('Plakanin Yer Tespiti');
        
    st = regionprops(bw2, 'BoundingBox');
    x=st.BoundingBox(3);
    y=st.BoundingBox(4);

 rectangle('Position',[st.BoundingBox(1),st.BoundingBox(2),st.BoundingBox(3),st.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2 )


