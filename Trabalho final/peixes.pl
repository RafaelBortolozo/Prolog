:- dynamic sim/1, nao/1.

%  Lista de peixes
selecao(bagre) :- is("Peixe nao possui escamas"),
                  is("Cor do peixe eh preto"),
                  is("Possui carne gorda"),
                  nl.

selecao(tilapia) :- is("Peixe possui escamas"),
                    is("Cor do peixe varia entre cinza e verde-azulado"),
                    is("Possui carne magra"),
                    nl.
  
selecao(carpa_capim) :- is("Peixe possui escamas"),
                        is("Cor do peixe eh amarelo prateado"),
                        is("Possui carne magra"),
                        nl.

selecao(cascudo) :- is("Peixe possui escamas"),
                    is("Cor do peixe eh preto"),
                    is("Possui carne magra"),
                    nl.

selecao(dourado) :- is("Peixe possui escamas"),
                    is("Cor do peixe eh amarelo-laranja"),
                    is("Possui carne gorda"),
                    nl.

selecao(pintado) :- is("Peixe nao possui escamas"),
                    is("Cor do peixe eh cinza com pintas pretas"),
                    is("Possui carne gorda"),
                    nl.

selecao(pacu) :-  is("Peixe possui escamas"),
                  is("Cor do peixe eh cinza"),
                  is("Possui carne gorda"),
                  nl.

selecao(carpa_cabecuda) :- is("Peixe possui escamas"),
                           is("Cor do peixe eh cinza"),
                           is("Possui carne magra"),
                           nl.

selecao(traira) :-  is("Peixe possui escamas"),
                    is("Cor do peixe eh marrom"),
                    is("Possui carne gorda"),
                    nl.

selecao(lambari) :- is("Peixe possui escamas"),
                    is("Cor do peixe eh prata"),
                    is("Possui carne magra"),
                    nl.

/* Não considera opções na categoria diferente do atributo que foi afirmado */
removeOthers(_, []).
removeOthers(Attribute, [H|T]) :- (dif(H, Attribute) -> 
                                    assert(nao(H)); true),
                                    removeOthers(Attribute, T).


/* Testa se o atributo está nesta categoria, se sim, chama eliminar outros */
removeMember(Attribute, List) :- member(Attribute, List) ->
                                        removeOthers(Attribute, List),
                                        true, !;
                                        false, !.


/* Chama  removeMember para cada categoria da ocorrência do Atributo */
elimination(Attribute) :-
  removeMember(Attribute,
    ["Peixe nao possui escamas", "Peixe possui escamas"]), true;
  removeMember(Attribute,
    ["Cor do peixe eh preto", "Cor do peixe varia entre cinza e verde-azulado","Cor do peixe eh amarelo prateado","Cor do peixe eh amarelo-laranja","Cor do peixe eh cinza com pintas pretas","Cor do peixe eh cinza", "Cor do peixe eh marrom", "Cor do peixe eh prata" ]), true;
  removeMember(Attribute,
    ["Possui carne magra","Possui carne gorda"]), true.
  
    


/* afirmar e desabilitar Atributos com base na entrada do usuário */
is(Attribute) :-
  ((sim(Attribute) ->
    true, !;
    nao(Attribute) ->
    false, !;
    format("~w?~n (sim/nao)", [Attribute]),
    read(Resposta),
    (Resposta = sim ->
      assert(sim(Attribute)),
      write(Attribute),
      nl,
      elimination(Attribute),
      true,
      !;
    Resposta = nao ->
      assert(nao(Attribute)), false, !;
    write("RESPONDA 'sim.' ou 'nao.'"), nl,
    is(Attribute)))).

/* Menu Princial */
search :-
  write("Me responda..."), nl,
  (selecao(X),
      write("Eu acho que eh "), write(X), write(" :)."), nl);
  (write("Nao conheco esse peixe"), nl).


init :- write("Akinator de peixe"), nl,
        /* retractall: Realiza a remoção de cláusulas de um predicado dinâmico */
         retractall(sim(_)), 
         retractall(nao(_)),
    search,
    write("Digite 'init.' para jogar novamente");
    fail.
