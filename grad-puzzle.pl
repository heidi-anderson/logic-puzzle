/* Facts */
first(michelle).
first(paul).
first(sam).

last(brown).
last(green).
last(black).

job(janitor).
job(landscaper).
job(waiter).

degree(finance).
degree(business).
degree(engineering).

% Of the three graduates, there is Michelle (working as a waiter), the one whose name is Black, and Paul.
% The one whose name is Green majored in Finance.
% Paul, whose name isn't Black, didn't sign up for a Business major.
% Sam chose Engineering for a college major but is not the janitor.

/* Rules */
relation(F,L,J,D):- first(F), last(L), job(J), degree(D).

different(X,Y,Z):-X\=Y,X\=Z,Y\=Z.

rules(F1,F2,F3,L1,L2,L3,J1,J2,J3,D1,D2,D3):- 
    relation(F1,L1,J1,D1),
    relation(F2,L2,J2,D2),
    relation(F3,L3,J3,D3),
    different(F1,F2,F3),
    different(L1,L2,L3),
    different(J1,J2,J3),
    different(D1,D2,D3),
    (F1 = michelle, J1 = waiter),
    (F2 = paul, L2 \= black, D2 \= business),
    (F3 = sam, L3 \= green, D3 = engineering).

solve(F1, L1, J1, D1, F2, L2, J2, D2, F3, L3, J3, D3) :-
    rules(F1, L1, J1, D1, F2, L2, J2, D2, F3, L3, J3, D3).