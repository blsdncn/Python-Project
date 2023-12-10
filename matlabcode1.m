A = imread(path);
B = reshape(A,1,[]);

dlmwrite('input.txt',B,'delimiter',' ');
