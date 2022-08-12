Algoritmo "JogodaVelha"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
Var
   C, Linha, Coluna, Cont, NovoValor, PosicaoAtualTabuleiro: Inteiro
   Tabuleiro: Vetor[1..3, 1..3] de Caractere
   Jogada, Posicao: Inteiro

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


Procedimento AtualizaTabuleiro (Posicao:Inteiro; Char:Caractere)
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
            Tabuleiro [Linha, Coluna] <- Char
         FimSe
      FimPara
   FimPara
FimProcedimento

Procedimento PularUmaLinha()
Inicio
   Escreval()
FimProcedimento

Procedimento Jogar()
Inicio
   Para Jogada <- 1 ate 7 faca
      Se (Jogada%2 = 0) entao
         Escreval ("Quer jogar [x] em qual posicao? ")
         Leia (Posicao)
         AtualizaTabuleiro(Posicao, "x")
         Limpatela()
         MostrarTabuleiro()
      Senao
         Escreval ("Quer jogar [0] em qual posicao? ")
         Leia (Posicao)
         AtualizaTabuleiro (Posicao, "0")
         Limpatela()
         MostrarTabuleiro()
      FimSe
   FimPara
FimProcedimento

Inicio
   InicializaTabuleiro()
   MostrarTabuleiro()
   PularUmaLinha()
   Jogar()

Fimalgoritmo