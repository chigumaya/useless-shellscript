convert -delay 50 -loop 0 - \( +clone -monochrome \) $(yes '( +clone -fx nn=p[-1,-1]+p[-1,0]+p[-1,1]+p[0,-1]+p[0,1]+p[1,-1]+p[1,0]+p[1,1];nn*(1-p)!=6&&nn!=5 )'| head -100) gif:-
