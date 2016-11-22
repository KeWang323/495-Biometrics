%%%%%%test_side%%%%%%
function [ index_side ] = test_side( str_Load_side,MeanFace_side,eigenVector_side,coefficient_side)
Image = loadImg(str_Load_side);
grayImage = rgb2gray(Image);
TestingImage = double(reshape(grayImage, [ ], 1));
[index_side] = PCAtesting( TestingImage, MeanFace_side,eigenVector_side,coefficient_side);

end

