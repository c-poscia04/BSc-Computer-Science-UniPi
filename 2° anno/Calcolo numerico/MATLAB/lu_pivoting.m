function [L,U,P] = lu_pivoting(A)
[m,n] = size(A);
if not(m == n)
    error('La matrice non è quadrata');
end 

% Inizializzazione delle matrici
P = eye(n);
U = A;
L = eye(n);

for k = 1 : n-1
    % Ricerca del pivot massimo in modulo nella colonna k (dalla riga k in giù)
    [val_max, idx_relativo] = max(abs(U(k:n, k)));
    p = idx_relativo + k - 1; % Indice reale della riga del pivot
    
    if val_max < 1e-12
        error('La matrice è singolare.');
    end
        
    % esegue gli scambi
    L([p k], 1:k-1) = L([k p], 1:k-1);
    U([p k], k:n)   = U([k p], k:n);
    P([p k], 1:n)   = P([k p], 1:n);
    
    % prosegue con l’eliminazione di Gauss
    L(k+1:n, k) = U(k+1:n, k) / U(k,k);
    U(k+1:n, k) = 0; % Forza a zero gli elementi sotto il pivot nella colonna k
    
    for i = k+1 : n
        U(i, k+1:n) = U(i, k+1:n) - L(i, k) * U(k, k+1:n);
    end
end

end
