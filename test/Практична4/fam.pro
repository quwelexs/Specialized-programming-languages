%факти про стать
male(petro).
male(ivan).
male(andrii).
male(oleksii).
male(danylo).

female(olena).
female(maria).
female(nataliia).
female(marta).

%факти про шлюб
married(petro, olena).
married(olena, petro).

married(ivan, nataliia).
married(nataliia, ivan).

married(maria, oleksii).
married(oleksii, maria).

%факти про батьківство
%діти Петра та Олени
parent(petro, ivan).
parent(petro, maria).
parent(olena, ivan).
parent(olena, maria).

% Діти Івана та Наталії
parent(ivan, andrii).
parent(ivan, marta).
parent(nataliia, andrii).
parent(nataliia, marta).

%діти Марії та Олексія
parent(maria, danylo).
parent(oleksii, danylo).

%правила
%grand_parent
% x є дідусем/бабусею z, якщо x є батьком y, а y є батьком z
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

%sibling
%x та y є сіблінгами, якщо у них є спільний батько z, і x не є y
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

