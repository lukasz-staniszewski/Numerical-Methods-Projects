function [eps] = precision() 
% REPREZENTACJA Oblicza dokładność maszynową (eps) komputera.
    % deklaracja + inicjalizacja zmiennych
    eps = 1; % eps reprezentuje g przed podzieleniem 
    % (najbardziej aktualne g, ale spełniające warunek)
    g = 1; % g jest w kolejnych iteracjach pętli dzielone przez 2
    fl = 1.0 + g; % wynik zsumowania aktualnej wersji g z 1
    while fl > 1.0
        % wynik powinien zwracać takie g, które spełnia dalej warunek dlatego 
        % konieczne jest aby eps zapamiętywało g przed podzieleniem
        eps = g;
        g = g / 2.0;
        fl = 1.0 + g;
    end
end

