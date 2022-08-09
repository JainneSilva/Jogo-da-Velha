Algoritmo "JogodaVelha"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
Var
   C, Linha, Coluna, Cont, ValInicial: Inteiro
   Tabuleiro: Vetor[1..3, 1..3] de Caractere

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
         ValInicial <- 0
         Se (Linha > 1) entao
            ValInicial <- Caracpnum (Tabuleiro [Linha - 1, 3]) + Coluna
         Senao
              ValInicial <- Coluna
         FimSe
         Tabuleiro [Linha, Coluna] <- Numpcarac (ValInicial)
      FimPara
   FimPara
FimProcedimento

Procedimento DesenhaEstrutura()
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



Inicio
   InicializaTabuleiro()
   DesenhaEstrutura()
   Escreval ("Vai jogar [x] em qual posicao? ")
Fimalgoritmo