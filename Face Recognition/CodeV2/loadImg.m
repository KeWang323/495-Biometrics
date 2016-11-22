%%%%%%loadImg.m%%%%%%
function [ Img ] = loadImg( str_Load )
Image = imread(str_Load);
Img = imresize(Image, [160 120]);
end

