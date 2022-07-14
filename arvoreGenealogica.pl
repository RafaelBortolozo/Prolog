homem(jim).
homem(tom).
homem(bob).
mulher(pam).
mulher(liz).
mulher(pat).
mulher(ann).
genitor(pam,bob).
genitor(tom,bob).
genitor(tom,liz).
genitor(bob,ann).
genitor(bob,pat).
genitor(pat,jim).

irma(X,Y) :- genitor(Z,X), genitor(Z,Y), mulher(Y), (X\=Y).
