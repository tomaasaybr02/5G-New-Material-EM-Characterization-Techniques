x = linspace(0,1000);
y1 = 4 + sin(x).*exp(0.1*x);
area(x,y1,'FaceColor','b','FaceAlpha',.3,'EdgeAlpha',.3)

y2 = 4 + cos(x).*exp(0.1*x);
hold on
area(x,y2,'FaceColor','r','FaceAlpha',.3,'EdgeAlpha',.3)
hold off
