Algoritmo "JogodaVelha"

Var
   C, Linha, Coluna, Cont, NovoValor, PosicaoAtualTabuleiro: Inteiro
   Tabuleiro: Vetor[1..3, 1..3] de Caractere
   Jogada, Posicao, DimensaoDaMatriz: Inteiro
   PosicaoValida: Logico
   Xis, Bola: Caractere

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
   Para Linha <- 1 ate DimensaoDaMatriz faca
      Para Coluna <- 1 ate DimensaoDaMatriz faca
         NovoValor <- 0
         Se (Linha > 1) entao
            NovoValor <- Caracpnum (Tabuleiro [Linha - 1, DimensaoDaMatriz]) + Coluna
         Senao
            NovoValor <- Coluna
         FimSe
         Tabuleiro [Linha, Coluna] <- Numpcarac (NovoValor)
      FimPara
   FimPara
FimProcedimento

Procedimento MostrarTabuleiro()
Inicio
   Para Linha <- 1 ate DimensaoDaMatriz faca
      DesenhaCruzETraco()
      Escreval ("")
      Para Coluna <- 1 ate DimensaoDaMatriz faca
         Escreva ("| ", Tabuleiro [Linha, Coluna], " ")
      FimPara
      Escreval ("|")
      Se (Linha = DimensaoDaMatriz) entao
         DesenhaCruzETraco()
      FimSe
   FimPara

   Escreval ("")

   Cont <- Cont + 1

   Se (Cont = DimensaoDaMatriz) entao
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
   Para Linha <- 1 ate DimensaoDaMatriz faca
      NovoValor <- PosicaoAtualTabuleiro
      Para Coluna <- 1 ate DimensaoDaMatriz faca
         Se (Linha > 1) entao
            PosicaoAtualTabuleiro <- NovoValor + Coluna
         Senao
            PosicaoAtualTabuleiro <- Coluna
         Fimse
         Se (PosicaoAtualTabuleiro = Posicao) entao
            Se (Tabuleiro [Linha, Coluna] <> Xis) E (Tabuleiro[Linha,Coluna] <> Bola) entao
               Tabuleiro [Linha, Coluna] <- Char
               Retorne Verdadeiro
            Senao
               Retorne Falso
            FimSe
         FimSe
      FimPara
   FimPara
FimFuncao

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

Procedimento InicializarJogo()
Inicio
   DimensaoDaMatriz <- 3
   Xis <- "X"
   Bola <- "O"

   InicializaTabuleiro()
   MostrarTabuleiro()
   PularUmaLinha()
FimProcedimento

Procedimento Jogar()
Inicio
   Jogada <- 1
   Enquanto ((Nao ExisteGanhador()) E (Jogada <= 7)) faca
      Se (Jogada%2 = 0) entao
         InsereNoTabuleiro(Xis)
      Senao
         InsereNoTabuleiro(Bola)
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
   Retorne JaExistePosicaoVencedora(Xis) Ou JaExistePosicaoVencedora(Bola)
FimFuncao

Procedimento MostrarResultado()
Inicio
   PularUmaLinha()
   Se (JaExistePosicaoVencedora (Xis)) entao
      Escreval ("Parabens, O Jogador com ", Xis, " foi o ganhador! :)")
   FimSe
   Se (JaExistePosicaoVencedora (Bola)) entao
      Escreval ("Parabens, O Jogador com ", Bola, " foi o ganhador! :)")
   Senao
      Escreval ("Deu Velha :(")
   FimSe
FimProcedimento

Procedimento PularUmaLinha()
Inicio
   Escreval()
FimProcedimento

Inicio
   InicializarJogo()
   Jogar()
   MostrarResultado()
Fimalgoritmo