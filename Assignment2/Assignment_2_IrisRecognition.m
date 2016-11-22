function Assignment_2_IrisRecognition()
for k=1:30
    imgname=strcat('D:\Courses Files\Biometrics\Assignment2\eyephoto\',num2str(k),'.tiff');
    [H,W] = read_image(imgname);
    [ah]=Gaussian_filter(a,10);
    [X0,Y0]=Find_PupilCenter(ah);
    [x1,y1]=find_innerboundary();
    [x2,y2]=outerboudary();
    figure(),imshow(a);
    hold on;
	plot(x1,y1,'.','color','red');
    plot(x2,y2,'.','color','blue');
%     imwrite(a,'a.jpg');
end
%%% read image %%%
    function [H,W] = read_image(eyepho)
        a=im2double(imread(eyepho));
        [H,W]=size(a);
    end
%%% Find_PupilCenter %%
    function [X0,Y0]=Find_PupilCenter(imgtocut)
        interest(:,:)=imgtocut(180:300,240:400);
%         imwrite(interest,'interest.jpg');
        interestuint8=im2uint8(abs(interest));
        for i=1:121
            for j=1:161
                if interestuint8(i,j)<50
                    interestuint8(i,j)=0;
                end
                if interestuint8(i,j)>=50
                    interestuint8(i,j)=255;
                end
            end
        end
%         imwrite(interestuint8,'interest2.jpg');
        hold on
        c=zeros(3,2);
        while c(1)==0
            for i=1:121
                for j=1:161
                    if interestuint8(i,j)==0
                        c(1,:)=[i,j];
                    end
                end
            end
        end
        while c(2)==0
            for j=1:161
                for i=1:121
                    if interestuint8(i,j)==0
                        c(2,:)=[i,j];
                    end
                end
            end
        end
        while c(3)==0
            for j=161:-1:1
                for i=1:121
                    if interestuint8(i,j)==0
                        c(3,:)=[i,j];
                    end
                end
            end
        end
        center=zeros(1,2);
        center(1,1)=round((c(2,2)+c(3,2))/2);
        center(1,2)=round((c(1,1)-(c(2,2)-c(3,2))/2));
        X0=239+center(1,1);
        Y0=179+center(1,2);
    end
%%% Gaussian_filter %%%
    function [ah]=Gaussian_filter(img,d0)
        fftimg=fft2(img);
        sfftimg=fftshift(fftimg);
        h=zeros(H,W);
        for i=1:H
            for j=1:W
                d=sqrt((i-H/2)^2+(j-W/2)^2);
                h(i,j)=exp(-d^2/(2*d0^2));
            end
        end
        sfftah=sfftimg.*h;
        fftah=ifftshift(sfftah);
        ah=ifft2(fftah);
%         imwrite(ah,'gaussian.jpg');
    end
%%% find_innerboudary %%%
    function [x,y]=find_innerboundary()
        [dx,dy]=gradient(ah);
        grad=zeros(1,90);
        for i=20:90
            for j=1:360
                theta=j/360*2*pi;
                x_grad=dx(round(i*sin(theta)+Y0),round(i*cos(theta)+X0));
                y_grad=dy(round(i*sin(theta)+Y0),round(i*cos(theta)+X0));
                grad(1,i)=grad(1,i)+abs(sqrt(x_grad^2+y_grad^2));
            end
        end
        [~,d]=find(grad==max(max(grad)));
        r=d;
        x=zeros(360);
        y=zeros(360);
        for j=1:360
            theta=j/360*2*pi;
            x(j)=round(r*cos(theta)+X0); 
            y(j)=round(r*sin(theta)+Y0);
        end
    end
%%% find_outerboudary %%%
    function [x,y]=outerboudary()
        [dx,dy]=gradient(ah);
        grad=zeros(1,70);
        for i=71:140
            for j=-44:1:45
                theta=j/360*2*pi;
                x_grad=dx(round(i*sin(theta)+Y0),round(i*cos(theta)+X0));
                y_grad=dy(round(i*sin(theta)+Y0),round(i*cos(theta)+X0));
                grad(1,i-70)=grad(1,i-70)+abs(sqrt(x_grad^2+y_grad^2));
            end
        end
        [~,d]=find(grad==max(max(grad)));
        r=d+70;
        x=zeros(360,1);
        y=zeros(360,1);
        for j=1:360
            theta=j/360*2*pi;
            x(j,1)=round(r*cos(theta)+X0); 
            y(j,1)=round(r*sin(theta)+Y0);
        end
 	end
end