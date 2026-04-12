function c = bisezione(f, a, b, n)
    fa = f(a);
    fb = f(b);

    if fa * fb >= 0
        error('L''intervallo [a,b] non è un intervallo di separazione');
    end

    for k = 1 : n 
        c = (a + b) / 2; % Punto medio
        fc = f(c);
        
        % Se trovo lo zero esatto, esco subito
        if fc == 0
            break;
        end
        
        % Controllo in quale metà si trova la radice
        if fa * fc < 0 
            b = c;   % sposto l'estremo destro
            fb = fc; 
        else 
            a = c;  % sposto l'estremo sinistro
            fa = fc; 
        end
    end
end
