x = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 70 100];
y = [80 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];


plot(x,y,'*-','LineWidth',3);
axis([0,100,0,100]);
xlabel('Fale Accepy Rate£¨%£©');
ylabel('False Reject Rate£¨%£©');
title('ROC curve')

