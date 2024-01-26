%Calcule le nombre d'arêtes composant le plus court chemin entre src et les
%autres sommets du graphes
function vect = number_path(spt,src)

vect = zeros(1,length(spt));

for i=1 :length(vect)
    pred = i;
    j = spt(pred);
    while j > 0
          pred = j;
          j = spt(pred);
          vect(i) = vect(i) + 1;
    end
    
    if pred ~= src
        vect(i) = 0;
    end
end
 
end