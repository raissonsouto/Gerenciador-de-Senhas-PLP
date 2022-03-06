import System.IO
import System.Exit
import Jogo
import SeletorDePalavras
--import UserJsonHandler

instructions::IO()
instructions = do
    putStrLn("\n"
        ++"#############################################################################################\n"
        ++"#                                                                                           #\n"
        ++"#                                       MANUAL DO JOGO                                      #\n"
        ++"#                                                                                           #\n"
        ++"#############################################################################################\n"
        ++"\nO jogo consiste em uma palavra de 5 letras selecionada\n"
        ++"aleatoriamente, seu objetivo como JOGADOR é tentar adivinhá-la em 6 tentativas!\n"
        ++"\n1) Digite uma palavra de 5 letras\n"
        ++"1.1) Receba um feedback via terminal, em cores, sobre as 5 letras digitadas\n"
        ++"2) FEEDBACK EM CORES NO TERMINAL\n"
        ++"2.1) Verde: a letra EXISTE e está no LOCAL CORRETO.\n"
        ++"2.2) Amarelo: a letra EXISTE, porém está no local errado.\n"
        ++"2.3) Vermelho: a letra INEXISTE na palavra.\n"
        ++"3) VITÓRIA OU DERROTA?\n"
        ++"3.1) Vitória: Se dentro das 6 tentativas o JOGADOR conseguir advinhar a palavra, ele vence.\n"
        ++"3.2) Derrota: Se o JOGADOR errar após a sexta tentativa, ele perde.\n")

exit::IO()
exit = do
    putStrLn("\n"
        ++"#####################################################################\n"
        ++"#                      ATÉ MAIS! OBRIGADO POR JOGAR :)              #\n"
        ++"#####################################################################\n") 
    exitSuccess

credits::IO()
credits = do   
    putStrLn("\n"
        ++"#############################################################################################\n"
        ++"#                                                                                           #\n"
        ++"#                                CRÉDITO AOS DESENVOLVEDORES                                #\n"
        ++"#             Jogo desenvolvido na disciplina de PLP pela UFCG 2021.1 em Haskell            #\n"
        ++"#                                                                                           #\n"
        ++"#############################################################################################\n"
        ++"\n"
        ++"Título do jogo: WORDLE\n"
        ++"Professor: Everton Leandro Galdino Alves\n"
        ++"Alunos:\n"
        ++"Raisson Souto (119210173)\n"
        ++"Luis Eduardo (119210431)\n"
        ++"Gabriel dos Santos (120110458)\n"
        ++"Joao Luciano (120110612)\n"
        ++"Rembrandt Costa (120110785)\n"
        ++"\n"
        ++"Baseado no jogo TERMO -> https://term.ooo  \n") 
        

wordleLogo::IO()
wordleLogo = do
    putStrLn ("\n"
        ++"###############################################################################\n"
        ++"#                                                                             #\n"
        ++"#                           BEM VINDO(A) AO                                   #\n"
        ++"#            ██╗    ██╗ ██████╗ ██████╗  ██████╗ ██╗     ███████╗             #\n" 
        ++"#            ██║    ██║██╔═══██╗██╔══██╗██╔═══██╗██║     ██╔════╝             #\n"
        ++"#            ██║ █╗ ██║██║   ██║██████╔╝██║   ██║██║     █████╗               #\n"
        ++"#            ██║███╗██║██║   ██║██╔══██╗██║   ██║██║     ██╔══╝               #\n"
        ++"#            ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝╚███████ ███████═╗            #\n"    
        ++"#             ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚══════╝ ╚══════╝            #\n"
        ++"###############################################################################\n")

startScreen::String -> String -> IO()
startScreen option username = do
    if option == "J" || option == "j" then do
        putStr("\n  Palavra aleatória selecionada!")
        hFlush stdout
        palavraEscolhida <- selectorWord
        jogo [] [] palavraEscolhida 0
        --addStats username
    else if option == "M" || option == "m" then instructions
    else if option == "S" || option == "s" then exit
    else if option == "C" || option == "c" then credits
    else if option == "H" || option == "h" then "h"--showStats username
    else putStrLn("\n  A Letra digitada não corresponde.") 

mainScreen::String -> IO()
mainScreen username = do
    putStr ("  [J]ogar \n"
        ++ "  [M]anual \n"
        ++ "  [H]istórico\n"
        ++ "  [C]réditos\n"
        ++ "  [S]air\n"
        ++ "  Digite uma letra >>> ")
    hFlush stdout
    input <- getLine
    startScreen input username
    mainScreen username

main::IO()
main = do
    wordleLogo
    putStr "Qual o seu username: "
    hFlush stdout
    username <- getLine
    if True --isUserRegistered username
    then
        putStrLn ("\nUsuário previamente cadastrado! Bem vindo, " ++ username ++ ".\n")
    else do
        putStrLn ("\nUsuário cadastrado com sucesso! Bem vindo, " ++ username ++ ".\n")
        --addUser username

    mainScreen username