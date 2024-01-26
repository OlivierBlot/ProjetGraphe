function viz_cut3D(G,cut,pos,nodename,srcs,dsts)

%# of cities
n=size(nodename,1);

%PLOT MST (first create new figure)
figure();

%DISPLAY CITIES NAME ON THE GRAPH
plot3(pos(:,1),pos(:,2),pos(:,3),'r.');hold on;  %display a red point for each city
for i=1:n
   % text(pos(i,1)+5,pos(i,2), sprintf('%s (%d)\n',nodename{i},i));
end   

%MAKE A CUT GRAPH FROM THE CUT DATA
Gcut=zeros(n,n,n);
for i=1:n
    for j=1:n
         for k=1:n
            if ((i~=j) && (cut(i)==1) && (cut(j)==-1) && (G(i,j)>0))
                Gcut(i,j,k)=1;
                Gcut(j,i,k)=1;
            end
        end
    end
end

%DISPLAY CUT
%first display src & dst 
plot3(pos(srcs,1),pos(srcs,2),pos(srcs,3),'ro','LineWidth',2);hold on;
plot3(pos(dsts,1),pos(dsts,2),pos(dsts,3),'r+','LineWidth',2);hold on;

%then graph
gplot3(G(1:n,1:n),pos,'-b');hold on;
%tehn cut
% [X,Y]=gplot3(Gcut,pos);
% %to change linewidth we have to use plot (gplot does not plot if it returns args)
% plot (X, Y, ':r', 'LineWidth', 4) ;
title('cut');
