function [L,U] = lu(A)
[m,n] = size(A); %numero di righe e colonne della matrice

% Controlla se la matrice è quadrata 
if not(n == m) 
    error('La matrice deve essere quadrata')
end

L = eye(n); % Scrivo i moltiplicatori in una matrice identità
U = A;      % All'inizio dell'algoritmo A = U

for k = 1 : n-1
    
    %Controllo sul pivot
    if U(k,k) == 0
        error('Errore: Incontrato un pivot nullo al passo %d. L''algoritmo si blocca.', k);
    end
    
    for j = k+1 : n
        L(j,k) = U(j,k) / U(k,k); % Calcola il moltiplicatore
        
        %Aggiorna solo dalla colonna k in poi
        U(j, k:n) = U(j, k:n) - L(j,k) * U(k, k:n); 
    end
end
end


