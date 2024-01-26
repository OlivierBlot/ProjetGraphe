function present = possedechaine(A,c)

taille = size(c,2);
present = 1;
for i=1:(taille-1)
    if ~A(c(i), c(i+1)) 
        present = 0;
    end
end

