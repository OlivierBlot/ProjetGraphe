clear all
close all

%% Représentation des nanosatellites - densité moyenne - graphe non valué

addpath('matlab_bgl');      %load graph libraries
addpath('matlab_tpgraphe'); %load tp ressources

%Chargement des données
T = table2array(readtable("topology_avg.csv"));

n = size(T,1);

sat_id = string(T(1:n,1)); %Identifiant du satelllite allant de 0 à 99
pos = T(1:n,2:end); %Coordonnées cartésiennes des satellites

%Définition de la matrice des distances entre les satellites
D = zeros(n,n); 
for i=1:n
    for j=1:n
        D(i,j) = norm([T(i,2)-T(j,2), T(i,3)-T(j,3), T(i,4)-T(j,4) ]);
    end
end

portee0 = 20000;

%Définition de la matrice d'adjacence du graphe 
A1 = badd(portee0*ones(n,n),-D); %Portée de 20km
A2 = badd(2*portee0*ones(n,n),-D); %Portée de 40km
A3 = badd(3*portee0*ones(n,n),-D); %Portée de 60km

%Représentation graphique des grapheq
viz_adj3D(D,A1,pos,sat_id)
viz_adj3D(D,A2,pos,sat_id)
viz_adj3D(D,A3,pos,sat_id)

%Calcul des degrés des graphes.
deg = affichage_degre(A1,A2,A3);
%Calcul du degré de clustering et calcul des cliques.
[clust, clique] = affichage_clustering(A1,A2,A3);
%Calcul des composantes connexes.
[nbr_cnx, size_cnx1, size_cnx2, size_cnx3] = affichage_connexe(A1,A2,A3);
%Calcul du nombre de plus courts chemins, leur distribution pour le sommet
%2 et moyenne pour chaque sommet.
affichage_plus_courts_chemins(A1,A2,A3,2);