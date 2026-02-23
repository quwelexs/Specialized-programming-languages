%aакти -ребра орієнтованого графа edge
edge(kyiv, lviv).
edge(lviv, uzhhorod).
edge(kyiv, odessa).
edge(odessa, lviv).
edge(lviv, ternopil).
edge(ternopil, chernivtsi).

%1.існування шляху path(A, B)
%базовий випадок, шлях існує, якщо є пряме ребро між а та b
path(A, B) :- 
    edge(A, B).

%рекурсивний випадок: шлях від a до b існує, якщо є ребро від a до якоїсь проміжної вершини x, і існує шлях від x до b
path(A, B) :- 
    edge(A, X), 
    path(X, B).

%2.довжина шляху в кількості ребер: path_length(A, B, L)
%базовий випадок, якщо є пряме ребро, довжина шляху = 1
path_length(A, B, 1) :- 
    edge(A, B).

%рекурсивний випадок: довжина шляху від a до b черезxX - це довжина шляху від x до b (L1) плюс 1
path_length(A, B, L) :- 
    edge(A, X), 
    path_length(X, B, L1), 
    L is L1 + 1.