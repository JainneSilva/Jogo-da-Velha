Algoritmo "JogodaVelha"

Var
   C, Linha, Coluna, Cont, NovoValor, PosicaoAtualTabuleiro: Inteiro
   Tabuleiro: Vetor[1..3, 1..3] de Caractere
   Jogada, Posicao: Inteiro
   PosicaoValida: Logico

Procedimento DesenhaCruzETraco()
Inicio
   Para C <- 0 ate 12 faca
      Se (C%4 = 0) entao
         Escreva ("+")
      Senao
         Escreva ("-")
      FimSe
   FimPara
FimProcedimento

Procedimento InicializaTabuleiro()
Inicio
   Para Linha <- 1 ate 3 faca
      Para Coluna <- 1 ate 3 faca
         NovoValor <- 0
         Se (Linha > 1) entao
            NovoValor <- Caracpnum (Tabuleiro [Linha - 1, 3]) + Coluna
         Senao
            NovoValor <- Coluna
         FimSe
         Tabuleiro [Linha, Coluna] <- Numpcarac (NovoValor)
      FimPara
   FimPara
FimProcedimento

Procedimento MostrarTabuleiro()
Inicio
   Para Linha <- 1 ate 3 faca
      DesenhaCruzETraco()
      Escreval ("")
      Para Coluna <- 1 ate 3 faca
         Escreva ("| ", Tabuleiro [Linha, Coluna], " ")
      FimPara
      Escreval ("|")
      Se (Linha = 3) entao
         DesenhaCruzETraco()
      FimSe
   FimPara

   Escreval ("")

   Cont <- Cont + 1

   Se (Cont = 3) entao
      Para  C <- 0 ate 12 faca
         Se (C%4 = 0) entao
            Escreva ("+")
         Senao
            Escreva ("-")
         FimSe
      FimPara
   FimSe
FimProcedimento


Funcao AtualizaTabuleiro (Posicao:Inteiro; Char:Caractere): Logico
Inicio
   PosicaoAtualTabuleiro <- 0
   Para Linha <- 1 ate 3 faca
      NovoValor <- PosicaoAtualTabuleiro
      Para Coluna <- 1 ate 3 faca
         Se (Linha > 1) entao
            PosicaoAtualTabuleiro <- NovoValor + Coluna
         Senao
            PosicaoAtualTabuleiro <- Coluna
         Fimse
         Se (PosicaoAtualTabuleiro = Posicao) entao
            Se (Tabuleiro [Linha, Coluna] <> "x") E (Tabuleiro[Linha,Coluna] <> "0") entao
               Tabuleiro [Linha, Coluna] <- Char
               Retorne Verdadeiro
            Senao
               Retorne Falso
            FimSe
         FimSe
      FimPara
   FimPara
FimFuncao

Procedimento PularUmaLinha()
Inicio
   Escreval()
FimProcedimento


Procedimento InsereNoTabuleiro(Char:Caractere)
Inicio
   Escreval ("Quer jogar [",Char,"] em qual posicao? ")
   Leia (Posicao)
   PosicaoValida <- AtualizaTabuleiro(Posicao, Char)
   Enquanto (Nao PosicaoValida) faca
      Escreval ("Posicao Invalida")
      Escreval ("Quer jogar [",Char,"] em qual posicao? ")
      Leia (Posicao)
      PosicaoValida <- AtualizaTabuleiro (Posicao, Char)
   FimEnquanto
   Limpatela()
   MostrarTabuleiro()
FimProcedimento


Procedimento Jogar()
Inicio
   Jogada <- 1
   Enquanto ((Nao ExisteGanhador()) E (Jogada <= 7)) faca
      Se (Jogada%2 = 0) entao
         InsereNoTabuleiro("x")
      Senao
         InsereNoTabuleiro("0")
      FimSe
      Jogada <- Jogada + 1
   FimEnquanto
FimProcedimento

Funcao JaExistePosicaoVencedora(Char: Caractere): Logico
Inicio
   Retorne (Tabuleiro[1,1] = Char) E (Tabuleiro[1,2] = Char) E (Tabuleiro[1 ,3] = Char) Ou (Tabuleiro[2,1] = Char) E (Tabuleiro[2,2] = Char) E (Tabuleiro[2,3] = Char) Ou(Tabuleiro[3,1] = Char) E (Tabuleiro[3,2] = Char) E (Tabuleiro[3,3] = Char) Ou (Tabuleiro[1,1] = Char) E (Tabuleiro[2,1] = Char) E (Tabuleiro[3,1] = Char) Ou(Tabuleiro[1,2] = Char) E (Tabuleiro[2,2] = Char) E (Tabuleiro[3,2] = Char) Ou (Tabuleiro[1,3] = Char) E (Tabuleiro[2,3] = Char) E (Tabuleiro[3,3] = Char) Ou (Tabuleiro[1,3] = Char) E (Tabuleiro[2,2] = Char) E (Tabuleiro[3,1] = Char) Ou (Tabuleiro[1,1] = Char) E (Tabuleiro[2,2] = Char) E (Tabuleiro[3,3] = Char)
FimFuncao

Funcao ExisteGanhador(): Logico
Inicio
   Retorne JaExistePosicaoVencedora("x") Ou JaExistePosicaoVencedora("0")
FimFuncao

Inicio
   InicializaTabuleiro()
   MostrarTabuleiro()
   PularUmaLinha()
   Jogar()
Fimalgoritmo