%%%%%%PCAtesting%%%%%%
function [idx] = PCAtesting( TestingImage, MeanFace,eigenVector,coefficient)

%Demean images
DemeanTestingFace = TestingImage - MeanFace;

coefTesting = DemeanTestingFace'*eigenVector;

[NumOfSamples,LengthOfCoefficient] = size(coefficient);
%compute the differences
for j=1:NumOfSamples
    CoefTestingDifference(j,:) =coefTesting-coefficient(j,:);
    EuclideanDistance(j,:)=sqrt(sum(CoefTestingDifference(j,:).*CoefTestingDifference(j,:)));
end
[EuclideanDistance, index]=sort(EuclideanDistance, 'ascend');

idx=[];
for i=1:3
    idx(i)=index(i);
end
end

