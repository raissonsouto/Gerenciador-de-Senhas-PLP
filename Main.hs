import System.IO
import System.Exit

instructions::String
instructions = 
    "\n"
    ++"######################################################"
    ++"#                                                    #"
    ++"#                  INSTRUÇÕES                        #"
    ++"#                                                    #"
    ++"######################################################"
    ++"\nO jogo consiste em uma palavra de 5 letras selecionada"
    ++"aleatoriamente, seu objetivo como JOGADOR é tentar adivinhá-la em 6 tentativas!"
    ++"\n1) Digite pela entrada padrão uma palavra de 5 letras"
    ++"1.1) Receba um feedback via terminal, em cores, sobre as 5 letras digitadas"
    ++"2) FEEDBACK EM CORES NO TERMINAL"
    ++"2.1) Verde: a letra EXISTE e está no LOCAL CORRETO."
    ++"2.2) Amarelo: a letra EXISTE, porém não está no local certo."
    ++"2.3) Vermelho: a letra NÃO EXISTE e não está no local certo."
    ++"3) VITÓRIA OU DERROTA?"
    ++"3.1) Vitória: Se dentro das 6 tentativas o JOGADOR conseguir advinhar a palavra, ele vence."
    ++"3.2) Derrota: Se o JOGADOR não conseguir adivinhar a palavra após a sexta tentativa, ele perde."


wordleLogo:: IO()
wordleLogo = do
    putStrLn ("\n"
        ++"##############################################################################\n"
        ++"#                                                                            #\n"
        ++"#                       BEM VINDO(A) AO                                      #\n"
        ++"#                      _________    ______   _______             _______     #\n"
        ++"#   \\             // ||        || ||     | ||       \\  ||       ||           #\n"
        ++"#    \\           //  ||        || ||_____/ ||      ||  ||       ||           #\n"
        ++"#     \\         //   ||        || ||   \\   ||      ||  ||       ||______     #\n"
        ++"#      \\  //\\  //    ||        || ||    \\  ||      ||  ||       ||           #\n"
        ++"#       \\//  \\//     ||________|| ||     \\ ||_____//   |_______ ||______     #\n"
        ++"#                                                                            #\n"
        ++"##############################################################################\n")

startScreen::String -> IO()
startScreen option = do
    if option == "J" || option == "j" then print "jogar"
    else if option == "I" || option == "i" then print "instruco"
    else if option == "S" || option == "s" then exitSuccess
    else print "quebrou"

main::IO()
main = do
    wordleLogo
    putStrLn "  [J]ogar"
    putStrLn "  [I]nstruções"
    putStrLn "  [S]air\n"
    putStr ">>> "
    hFlush stdout
    input <- getLine
    startScreen input

-- criar gameInicial.hs e fazer import
-- [C]reditos 
-- else mensagem de erro startScreen
--ajeitar o instructions! "\n"