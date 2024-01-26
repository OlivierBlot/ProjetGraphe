clear all
close all

%% Représentation des nanosatellites - densité forte - graphe valué

addpath('matlab_bgl');      %load graph libraries
addpath('matlab_tpgraphe'); %load tp ressources

%Chargement des données
T = table2array(readtable("topology_high.csv"));

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

%Définition de la matrice d'adjacence du graphe non valué pour une portée
%de 60km
A = badd(60000*ones(100,100),-D);

%Définition de la matrice d'adjacence du graphe valué pour une portée
%de 60km
C = D;
C(C > 60000) = 0;
bw = C.*C; %Le coût associé est égal au carré de la distance entre chaque satellite.

%Calcul des degrés des graphes.
affichage_degre((bw > 0),A,[]);
%Calcul des composantes connexes.
affichage_connexe(bw,A,[]);
%Calcul du degré de clustering et calcul des cliques.
affichage_clustering((bw > 0),A,[]);
%Calcul du nombre de plus courts chemins, leur distribution pour le sommet
%2 et moyenne pour chaque sommet.
affichage_plus_courts_chemins(bw,A,[],2);