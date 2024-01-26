%Calcule et affiche pour un sommet j le plus court chemin avec les autres sommets,
%leur distribution et la moyenne des plus courts chemins
function affichage_plus_courts_chemins(A1,A2,A3,j)

if ~isempty(A3) %Cas des graphes non valués : fonctionne pour les 3 portées disponibles

   %Plus court chemin entre le sommet j et les autres sommets
   [poids1, ~]  = shortest_paths(sparse(A1), j);
   [poids2, ~]  = shortest_paths(sparse(A2), j);
   [poids3, ~]  = shortest_paths(sparse(A3), j);
    
   %On remplace les Inf par 0
   poids1(poids1 == Inf) = 0;
   poids2(poids2 == Inf) = 0;
   poids3(poids3 == Inf) = 0;
    

    v_mlc1 = ones(1,length(poids1));
    v_mlc2 = v_mlc1;
    v_mlc3 = v_mlc1;
    X = ones(1,length(poids1));
    
    %Moyenne des plus courts chemins pour chaque sommet
    for i=1 : length(poids1)

        [p1, ~]  = shortest_paths(sparse(A1), i);
        [p2, ~]  = shortest_paths(sparse(A2), i);
        [p3, ~]  = shortest_paths(sparse(A3), i);

        p1(p1 == Inf) = 0;
        p2(p2== Inf) = 0;
        p3(p3 == Inf) = 0;

        moy_lgchemin1 = sum(p1) / length(p1);
        moy_lgchemin2 = sum(p2) / length(p2);
        moy_lgchemin3 = sum(p3) / length(p3);

        v_mlc1(i) = moy_lgchemin1;
        v_mlc2(i) = moy_lgchemin2;
        v_mlc3(i) = moy_lgchemin3;

        X(i) = i-1;
    end
    
    %Representation graphique des plus courts chemins entre le sommet j et
    %les autres sommets
    figure()
    subplot(1,3,1)
    bar(poids1)
    title("Portée de 20km")
    subplot(1,3,2)
    bar(poids2)
    title("Portée de 40km")
    subplot(1,3,3)
    bar(poids3)
    title("Portée de 60km")
    sgtitle("Plus courts chemins pour aller à chaque sommet en partant du sommet j")
    
    %Representation graphique de la distribution des plus courts chemins entre le sommet j et
    %les autres sommets
    figure()
    subplot(1,3,1)
    hist(poids1)
    title("Portée de 20km")
    subplot(1,3,2)
    hist(poids2)
    title("Portée de 40km")
    subplot(1,3,3)
    hist(poids3)
    title("Portée de 60km")
    sgtitle("Répartition des plus courts chemins en partant du sommet j")
    
    %Representation graphique de la moyenne des plus courts chemins selon
    %le sommet de départ
    figure()
    subplot(1,3,1)
    plot(X,v_mlc1)
    title("Portée de 20km")
    subplot(1,3,2)
    plot(X,v_mlc2)
    title("Portée de 40km")
    subplot(1,3,3)
    plot(X,v_mlc3)
    title("Portée de 60km")
    sgtitle("Moyenne des plus courts chemins selon le sommet de départ")

else %Cas des graphes valués : fonctionne pour une portée de 60km sur la matrice d'adjacence valuée et celle non valuée
    
   %Plus court chemin entre le sommet j et les autres sommets
   [~, spt1]  = shortest_paths(sparse(A1), j); %A1 étant valuée, poids1 ne correspond pas au nombre d'arêtes
   [poids2, ~]  = shortest_paths(sparse(A2), j);
   
   %A partir de spt1, on récupère le nombre d'arêtes entre le sommet j et
   %les autres sommets
   poids1 = number_path(spt1,j);
   poids2(poids2 == Inf) = 0;
    

    v_mlc1 = ones(1,length(poids1));
    v_mlc2 = v_mlc1;
    
    X = ones(1,length(poids1));

    %Moyenne des plus courts chemins pour chaque sommet
    for i=1 : length(poids1)

        [~, spt]  = shortest_paths(sparse(A1), i);
        [p2, ~]  = shortest_paths(sparse(A2), i);
        
        p1 = number_path(spt,i);
        p2(p2== Inf) = 0;
       
        moy_lgchemin1 = sum(p1) / length(p1);
        moy_lgchemin2 = sum(p2) / length(p2);
       
        v_mlc1(i) = moy_lgchemin1;
        v_mlc2(i) = moy_lgchemin2;
       
        X(i) = i-1;
    end
    
    %Representation graphique des plus courts chemins entre le sommet j et
    %les autres sommets
    figure()
    subplot(1,2,1)
    bar(poids1)
    title("Graphe valué");
    subplot(1,2,2)
    bar(poids2)
    title("Graphe non valué");
    sgtitle("Pour une portée de 60km, Plus courts chemins pour aller à chaque sommet en partant du sommet j")
    
    %Representation graphique de la distribution des plus courts chemins entre le sommet j et
    %les autres sommets
    figure()
    subplot(1,2,1)
    hist(poids1)
    title("Graphe valué");
    subplot(1,2,2)
    hist(poids2)
    title("Graphe non valué");
    sgtitle("Pour une portée de 60km, Répartition des plus courts chemins en partant du sommet j ")
    
    %Representation graphique de la moyenne des plus courts chemins selon
    %le sommet de départ
    figure()
    plot(X,v_mlc1)
    hold on
    plot(X,v_mlc2)
    title("Pour une portée de 60km, Moyenne des plus courts chemins selon le sommet de départ")
    legend("Graphe valué", "Graphe non valué");

end

end