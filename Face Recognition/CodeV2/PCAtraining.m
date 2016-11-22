%%%%%%PCAtraining.m%%%%%%
function [ MeanFace,eigenVector,coefficient ] = PCAtraining( TrainingImage,NumOfEigenVectors )

[NumOfPixelPerSample,NumOfSamples] = size(TrainingImage);
MeanFace=0;
DemeanFace=zeros(NumOfPixelPerSample,NumOfSamples);

%meanface
for i = 1: NumOfSamples
    MeanFace = MeanFace+TrainingImage(:,i);
end
MeanFace = MeanFace/NumOfSamples;

%demeanface
for i = 1: NumOfSamples
    DemeanFace(:,i) = TrainingImage(:,i) - MeanFace;
end

%Eigenvectors&Eigenvalues
[vectors,D]=eig(DemeanFace'*DemeanFace);
eigenValue2=eig(DemeanFace'*DemeanFace);
for i=1:NumOfSamples
    eigenVector2(:,i)=(DemeanFace*vectors(:,i))/sqrt(eigenValue2(i));
end
[eigenValue, index]=sort(eigenValue2, 'descend');
eigenVector=eigenVector2(:,index);

for i=1:NumOfSamples
    for j = 1:NumOfEigenVectors
        coefficient(i,j) = DemeanFace(:,i)'*eigenVector(:,j);
    end
end

end

