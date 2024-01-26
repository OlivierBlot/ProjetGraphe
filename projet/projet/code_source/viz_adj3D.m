function viz_adj3D(G,A,pos,nodename)

%# of cities
n=size(nodename,1);

%PLOT GRAPH(first create new figure)
figure();

%DISPLAY CITIES NAME ON THE GRAPH
plot3(pos(:,1),pos(:,2),pos(:,3),'r.');hold on;  %display a red point for each city
for i=1:n
   %text(pos(i,1)+5,pos(i,2), [nodename(i) '(' int2str(i) ')']); %with the name of the city
   % text(pos(i,1)+5,pos(i,2),pos(i,3), sprintf('%s (%d)\n',nodename{i},i));
end   

%DISPLAY SPT

gplot3(A(:,:,1),pos);
title("Graphe des connexions entre satellites");