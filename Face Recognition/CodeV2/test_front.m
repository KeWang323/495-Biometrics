%%%%%%test_front.m%%%%%%
function [ index_front ] = test_front( str_Load_front,MeanFace_front,eigenVector_front,coefficient_front)
Image = loadImg(str_Load_front);
grayImage = rgb2gray(Image);
TestingImage = double(reshape(grayImage, [ ], 1));
[index_front] = PCAtesting( TestingImage, MeanFace_front,eigenVector_front,coefficient_front);
end

