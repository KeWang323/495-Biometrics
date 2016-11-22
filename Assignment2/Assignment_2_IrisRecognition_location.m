clc;
clear;
a=im2double(imread('D:\Courses Files\Biometrics\Assignment2\2008-03-11_13\04233\04233d1716.tiff'));
b(:,:)=a(180:300,240:400);
d0=10;

fftb=fft2(b);
sfftb=fftshift(fftb);
[H,W]=size(b);
h=zeros(H,W);
for i=1:H
	for j=1:W
        d=sqrt((i-H/2)^2+(j-W/2)^2);
        h(i,j)=exp(-d^2/(2*d0^2));
    end
end
sfftbh=sfftb.*h;
fftbh=ifftshift(sfftbh);
bh=ifft2(fftbh);

[dx,dy]=gradient(bh);
bh=im2uint8(abs(bh));
for i=1:H
	for j=1:W
        if bh(i,j)<40
            bh(i,j)=0;
        end
        if bh(i,j)>=40
            bh(i,j)=255;
        end
    end
end
imshow(bh);
hold on
c=zeros(3,2);
while c(1)==0
    for i=1:H
        for j=1:W
            if bh(i,j)==0
                c(1,:)=[i,j];
            end
        end
    end
end
plot(c(1,2),c(1,1),'.');
while c(2)==0
    for j=1:W
        for i=1:H
            if bh(i,j)==0
                c(2,:)=[i,j];
            end
        end
    end
end
plot(c(2,2),c(2,1),'.');
while c(3)==0
    for j=W:-1:1
        for i=1:H
            if bh(i,j)==0
                c(3,:)=[i,j];
            end
        end
    end
end
plot(c(3,2),c(3,1),'.');
center=zeros(1,2);
center(1,1)=round((c(2,2)+c(3,2))/2);
center(1,2)=round((c(1,1)-(c(2,2)-c(3,2))/2));
plot(center(1,1),center(1,2),'.');