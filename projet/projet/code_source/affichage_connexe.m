%Calcule le nombre de composantes connexes et leur ordre.
function [nbr_cnx, size_cnx1, size_cnx2, size_cnx3] = affichage_connexe(A1,A2,A3) 

if ~isempty(A3) %Cas des graphes non valués : fonctionne pour les 3 portées disponibles

 %Calcul des composantes connexes avec la fonction components()
 [ ~, size_cnx1] = components(sparse(A1)) %size_cnx donne l'ordre de chaque composante connexe
 nbr_cnx1 = length(size_cnx1); 
 [~ , size_cnx2] = components(sparse(A2))
 nbr_cnx2 = length(size_cnx2);
 [~, size_cnx3] = components(sparse(A3))
 nbr_cnx3 = length(size_cnx3);
    
 nbr_cnx = [nbr_cnx1, nbr_cnx2, nbr_cnx3]

else %Cas des graphes valués : fonctionne pour une portée de 60km sur la matrice d'adjacence valuée et celle non valuée
 
 %Calcul des composantes connexes avec la fonction components()
 [ ~, size_cnx1] = components(sparse(A1));
 nbr_cnx1 = length(size_cnx1);
 [~ , size_cnx2] = components(sparse(A2));
 nbr_cnx2 = length(size_cnx2);

 if size_cnx1 == size_cnx2
     fprintf("Les deux graphes ont les mêmes composantes connexes \n");
  end
    
 nbr_cnx = [nbr_cnx1, nbr_cnx2];
 
end
end