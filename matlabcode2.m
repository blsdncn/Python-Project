CFile = fopen('c_output.txt','r');
FileContents = fscanf(CFile,'%c');
fclose(CFile);
ContentsToNum = uint8(str2num(FileContents));
CReshaped = reshape(ContentsToNum,256,256);

HaskellFile = fopen('haskelloutput.txt','r');
FileContents = fscanf(HaskellFile,'%c');
fclose(CFile);
ContentsToNum = uint8(str2num(FileContents));
HReshaped = reshape(ContentsToNum,256,256);

PrologFile = fopen('prologout.txt', 'r');
FileContents = fscanf(PrologFile, '%c');
fclose(PrologFile);
ContentsToNum = uint8(str2num(FileContents));
PReshaped = reshape(ContentsToNum,256,256);

figure;

subplot(2,2,1);
imshow(imread("mickey-1.png"));
title('Original Image');

subplot(2,2,2);
imshow(CReshaped);
title('Black & White Image from C');

subplot(2,2,3);
imshow(HReshaped);
title('Inverted color image from Haskell');

subplot(2,2,4);
imshow(PReshaped);
title('Flipped Image From Prolog');

