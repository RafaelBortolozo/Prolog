:- use_module(library(pce)).

:- new(Dialogo, dialog('Minha Interface')),
new(Titulo, label(nome, 'Calculadora')),
new(Texto1, text_item('Número 1:')),
new(Texto2, text_item('Número 2:')),
new(Texto3, text_item('Resultado:')),
new(SumBotao, button('Somar',message(@prolog,somar,Texto1?selection,Texto2?selection,Texto3))),
new(SubBotao, button('Subtrair',message(@prolog,subtrair,Texto1?selection,Texto2?selection,Texto3))),
new(MultBotao, button('Multiplicar',message(@prolog,multiplicar,Texto1?selection,Texto2?selection,Texto3))),
new(DivBotao, button('Dividir',message(@prolog,dividir,Texto1?selection,Texto2?selection,Texto3))),
new(SairBotao, button('Sair',message(Dialogo, destroy))),

send_list(Dialogo, append,[Titulo, Texto1, Texto2, Texto3, SumBotao, SubBotao, MultBotao, DivBotao, SairBotao]),
send(Dialogo, open).

somar(N1,N2,R) :- atom_number(N1,N1c),atom_number(N2,N2c), Resultado is N1c + N2c,send(R,
selection, Resultado).

subtrair(N1,N2,R) :- atom_number(N1,N1c),atom_number(N2,N2c), Resultado is N1c - N2c,send(R,
selection, Resultado).

multiplicar(N1,N2,R) :- atom_number(N1,N1c),atom_number(N2,N2c), Resultado is N1c * N2c,send(R,
selection, Resultado).

dividir(N1,N2,R) :- atom_number(N1,N1c),atom_number(N2,N2c), Resultado is N1c / N2c,send(R,
selection, Resultado).

