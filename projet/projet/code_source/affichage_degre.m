%Calcule le degré de chaque sommets et affiche la distribution du degré
function degres = affichage_degre(A1,A2,A3)

if ~isempty(A3) %Cas des graphes non valués : fonctionne pour les 3 portées disponibles
    
    %Le degré d'un sommet correspond à la somme des coéfficients d'une
    %ligne/colonne 
    somme_deg1 = sum(A1) - 1; % -1 car avec badd les coéfficients diagonaux valent 1
    somme_deg2 = sum(A2) - 1;
    somme_deg3 = sum(A3) - 1;
    
    %Moyenne des degrés
    deg1 = sum(somme_deg1) / 100;
    deg2 = sum(somme_deg2) / 100;
    deg3 = sum(somme_deg3) / 100;
    
    degres = [deg1,deg2,deg3]
    
    %Représentation graphique de la distribution des degrés
    figure();
    subplot(1,3,1)
    hist(somme_deg1)
    title("Portée de 20km")
    subplot(1,3,2)
    hist(somme_deg2)
    title("Portée de 40km")
     subplot(1,3,3)
    hist(somme_deg3)
    title("Portée de 60km")
    sgtitle("Distribution du degré")
    
else %Cas des graphes valués : fonctionne pour une portée de 60km sur la matrice d'adjacence valuée et celle non valuée
    
    %Le degré d'un sommet correspond à la somme des coéfficients d'une
    %ligne/colonne
    somme_deg1 = sum(A1) ; % Pas de -1 car badd n'est pas utilisé
    somme_deg2 = sum(A2) - 1;
    
    %Moyenne des degrés
    deg1 = sum(somme_deg1) / 100;
    deg2 = sum(somme_deg2) / 100;
    
    degres = [deg1 ,deg2];
    if somme_deg2 == somme_deg1
     fprintf("Les sommets du graphe valué et du graphe non valué ont le même degré \n");
    end

    figure();
    
    %Représentation graphique de la distribution des degrés
    subplot(1,2,1)
    hist(somme_deg1)
    title("Graphe valué")
    subplot(1,2,2)
    hist(somme_deg2)
    title("Graphe non valué")
    sgtitle("Distribution du degré pour une portée de 60km")
   
end
end