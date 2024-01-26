%%%%% SET ENV %%%%%

clear all
close all 

addpath('matlab_bgl');      %load graph libraries
addpath('matlab_tpgraphe'); %load tp ressources

load TPgraphe.mat;          %load data

%%%%%% DISPLAY INPUT DATA ON TERMINAL %%%%%

cities %names of cities
D      %distance matrix bw cities
pos    %x-y pos of the cities

%%%%%%EXO 1 (modeliser et afficher le graphe) %%%%%

longueur = 500*ones(27,27);
A = badd(longueur,-D);

viz_adj(D,A,pos,cities);
% viz_adj(D,graphPower(A,2),pos,cities);
% viz_adj(D,graphPower(A,3),pos,cities);
% viz_adj(D,graphPower(A,10),pos,cities);
% viz_adj(D,graphPower(A,12),pos,cities);

%%%%%% EXO 2 %%%%%

% %Q1 - existence d'un chemin de longueur 3
% 
% L2 = graphPower(A,2);
% L3 = graphPower(A,3);
% L = L3 - L2
% 
% %Q2 - nb de chemins de 3 sauts
% nbe3 = sum(sum(A*A*A))
% 
% %Q3 - nb de chemins <=3
% nble3 = sum(sum(A*A*A + A*A + A))
% 
% %%%%%%%% EXO 3 %%%%%
% 
% c=[19 24 26]; %la chaine 18 13 9 est t dans le graphe?
% possedechaine(A,c)
% c=[18 6 3]; %la chaine 18 6 3 est t dans le graphe?
% possedechaine(A,c)
% c=[26 5 17]; %la chaine 26 5 17 est t dans le graphe?
% possedechaine(A,c)
% 
% %%%%%%%% EXO 4%%%%%
% isEulerien(A)
% 
% %%%%%%%% EXO 5%%%%%
% porteeEulerien(D)
