homem(abraham).
homem(clancy).
homem(herb).
homem(homer).
homem(bart).
mulher(mona).
mulher(jackie).
mulher(marge).
mulher(patty).
mulher(selma).
mulher(lisa).
mulher(maggie).
mulher(ling).

genitor(abraham, herb).
genitor(abraham, homer).
genitor(mona, homer).
genitor(clancy, marge).
genitor(clancy, patty).
genitor(clancy, selma).
genitor(jackie, marge).
genitor(jackie, patty).
genitor(jackie, selma).
genitor(homer, bart).
genitor(homer, lisa).
genitor(homer, maggie).
genitor(marge, bart).
genitor(marge, lisa).
genitor(marge, maggie).
genitor(selma, ling).

casado(homer, marge).
casado(abraham, mona).
casado(clancy, jackie).
casada(marge, homer).
casada(mona, abraham).
casada(jackie, clancy).
falecida(mona).

irma(X,Y) :- genitor(Z,X), genitor(Z,Y), mulher(Y), (X\=Y).
