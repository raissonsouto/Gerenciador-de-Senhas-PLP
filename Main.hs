import System.IO
import System.Exit
import Jogo
import SeletorDePalavras

instructions::IO()
instructions = do
    putStrLn("\n"
        ++"#############################################################################################\n"
        ++"#                                                                                           #\n"
        ++"#                                         INSTRUÇOES                                        #\n"
        ++"#                                                                                           #\n"
        ++"#############################################################################################\n"
        ++"\nO jogo consiste em uma palavra de 5 letras selecionada aleatoriamente,\n"
        ++"seu objetivo como JOGADOR e tentar adivinhar em 5 tentativas!\n"
        ++"\n1) Digite pela entrada padrao uma palavra de 5 letras\n"
        ++"1.1) Receba um feedback via terminal, em cores, sobre as 5 letras digitadas\n"
        ++"2) FEEDBACK EM CORES NO TERMINAL\n"
        ++"2.1) Verde: a letra EXISTE e corresponde a POSICAO CORRETA.\n"
        ++"2.2) Amarelo: a letra EXISTE, porem nao corresponde a POSICAO CORRETA.\n"
        ++"2.3) Vermelho: a letra NAO EXISTE e nao corresponde a POSICAO CORRETA.\n"
        ++"3) WIN OR LOSE?\n"
        ++"3.1) WIN: Se dentro das 5 tentativas o JOGADOR conseguir advinhar a palavra, ele vence.\n"
        ++"3.2) LOSE: Se o JOGADOR nao conseguir adivinhar a palavra depois da sexta tentativa, ele perde.\n")

exit::IO()
exit = do
    putStrLn("\n"
        ++"#####################################################################\n"
        ++"#                      ATE MAIS! OBRIGADO POR JOGAR :)              #\n"
        ++"#####################################################################\n") 
    exitSuccess

credits::IO()
credits = do   
    putStrLn("\n"
        ++"#############################################################################################\n"
        ++"#                                                                                           #\n"
        ++"#                                CREDITO AOS DESENVOLVEDORES                                #\n"
        ++"#             Jogo desenvolvido na disciplina de PLP pela UFCG 2021.1 em Haskell            #\n"
        ++"#                                                                                           #\n"
        ++"#############################################################################################\n"
        ++"\n"
        ++"Titulo do jogo: WORDLE\n"
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

startScreen::String -> IO()
startScreen option = do
    if option == "J" || option == "j" then do
        putStr("\n  Palavra aleatoria selecionada!")
        hFlush stdout
        palavraEscolhida <- selectorWord
        jogo [] [] palavraEscolhida 0
    else if option == "I" || option == "i" then instructions
    else if option == "S" || option == "s" then exit
    else if option == "C" || option == "c" then credits
    else putStrLn("\n  A Letra digitada nao corresponde.") 

mainScreen:: IO()
mainScreen = do
    putStr ("  [J]ogar \n"
        ++ "  [I]nstruçoes \n"
        ++ "  [C]reditos\n"
        ++ "  [S]air\n"
        ++ "  Digite uma letra >>> ")
    hFlush stdout
    input <- getLine
    startScreen input
    mainScreen

main::IO()
main = do
    wordleLogo
    mainScreen

