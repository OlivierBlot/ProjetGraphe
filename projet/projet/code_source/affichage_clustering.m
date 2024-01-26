%Calcule la moyenne du degré de clustering, le nombre des cliques et affiche
%la distribution du degré de clustering et la distriution de l'ordre des
%cliques
function [moy_clst, nbr_clq] = affichage_clustering(A1,A2,A3)

if ~isempty(A3)  %Cas des graphes non valués : fonctionne pour les 3 portées disponibles

 %Calcul du degré de clustering avec la fonction clustering_coefficients()
 clst1 = clustering_coefficients(sparse(A1));
 clst2 = clustering_coefficients(sparse(A2));
 clst3 = clustering_coefficients(sparse(A3));
    
  %Moyenne du degré de clustering
  moy_clst1 = sum(clst1)/100;
  moy_clst2 = sum(clst2)/100;
  moy_clst3 = sum(clst3)/100;

  moy_clst = [moy_clst1, moy_clst2, moy_clst3]
    
  %Renvoie une matrice binaire où chaque colonne représente une clique avec la fonction maximalCliques()
  clique1 = maximalCliques(A1-diag(diag(ones(100)))); %on supprime les coéfficients diagonaux
  clique2 = maximalCliques(A2-diag(diag(ones(100))));
  clique3 = maximalCliques(A3-diag(diag(ones(100))));
    
  %Nombre de cliques
  nbr_clq1 = length(clique1(1,:))
  nbr_clq2 = length(clique2(1,:))
  nbr_clq3 = length(clique3(1,:))

  nbr_clq = [nbr_clq1, nbr_clq2, nbr_clq3]; 
 
  %Ordre de chaque clique
  ordre_clq1 = sum(clique1);
  ordre_clq2 = sum(clique2);
  ordre_clq3 = sum(clique3);
      
  %Représentation graphique de la distribution du degré de clustering  
  figure()
  subplot(1,3,1)
  hist(clst1)
  title("Portée de 20km")
  subplot(1,3,2)
  hist(clst2)
  title("Portée de 40km")
  subplot(1,3,3)
  hist(clst3)
  title("Portée de 60km")
  sgtitle("Distribution du degré de clustering")
  
  %Représentation graphique de l'ordre des cliques  
  figure()
  subplot(1,3,1)
  hist(ordre_clq1)
  title("Portée de 20km")
  subplot(1,3,2)
  hist(ordre_clq2)
  title("Portée de 40km")
  subplot(1,3,3)
  hist(ordre_clq3)
  title("Portée de 60km")
  sgtitle("Distribution de l'ordre des cliques")

else %Cas des graphes valués : fonctionne pour une portée de 60km sur la matrice d'adjacence valué et celle non valué
    
  %Calcul du degré de clustering avec la fonction clustering_coefficients()
  clst1 = clustering_coefficients(sparse(A1));
  clst2 = clustering_coefficients(sparse(A2));

  %Moyenne du degré de clustering
  moy_clst1 = sum(clst1)/100;
  moy_clst2 = sum(clst2)/100;

  moy_clst = [moy_clst1, moy_clst2];
   
  if moy_clst1 == moy_clst2 
      fprintf("La moyenne du degré de clustering est la même pour le graphe valué et non valué \n");
  end
    
  if clst1 == clst2
     fprintf("La distribution du degré de clustering est la même pour le graphe valué et non valué \n");
  end
    
  %Renvoie une matrice binaire où chaque colonne représente une clique avec la fonction maximalCliques()
  clique1 = maximalCliques(A1);
  clique2 = maximalCliques(A2-diag(diag(ones(100))));
    
  if clique1 == clique2
     fprintf("Le graphe valué et non valué ont le même nombre de cliques, tous de même ordre \n");
  end

  %Nombre de clique
  nbr_clq1 = length(clique1(1,:));
  nbr_clq2 = length(clique2(1,:));
  
  nbr_clq = [nbr_clq1, nbr_clq2]; 
  
  %Ordre de chaque clique
  ordre_clq1 = sum(clique1);
  ordre_clq2 = sum(clique2);
 
  %Représentation graphique de la distribution du degré de clustering  
  figure()
  subplot(1,2,1)
  hist(clst1)
  title("Graphe valué");
  subplot(1,2,2)
  hist(clst2)
  title("Graphe non valué");
  sgtitle("Pour une portée de 60km, Distribution du degré de clustering")

  %Représentation graphique de l'ordre des cliques
  figure()
  subplot(1,2,1)
  hist(ordre_clq1)
  title("Graphe valué");
  subplot(1,2,2)
  hist(ordre_clq2)
  title("Graphe non valué");
  sgtitle("Pour une portée de 60km, Distribution de l'ordre des cliques")
   
end
end