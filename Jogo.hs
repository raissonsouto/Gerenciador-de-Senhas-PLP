import System.IO

module Jogo where
    toLowerString :: [Char] -> [Char]
    toLowerString str = [ toLower x | x <- str]
    
    checkInputLength::String->Bool
    checkInputLength texto = do
        length texto /= 5
    
    jogo::[[String]]->Int->IO()
    jogo (tentativas:correcao) recursao = do
    
        newGuess <- getLine
        if checkInputLength newGuess
        then do
            putStr "Palavra com tamanho errado. Tente novamente: "
            hFlush stdout
            jogo (tentativas:metadados) recursao
        else do
            -- (tentativas ++ newGuess)
            -- let metadado = guessChecker newGuess
            -- (metadados ++ metadado)
            putStrLn (colorfulPrint tentativas metadados)
            if False == "VVVVV" then putStrLn "Voce ganhou!" -- colocar metadado no lugar do False: if metadado == "VVVVV" then putStrLn "Voce ganhou!"
            else if recursao > 3 then putStrLn "Você perdeu!"
            else jogo (tentativas:metadados) (recursao+1)

    winMessage:: IO()
    winMessage = do
            putStrLn ("\n"
        ++"######################################################################\n"                                                                    
        ++"#                                                                    #\n"
        ++"#        ██╗   ██╗ ██████╗ ██╗   ██╗     ██╗    ██╗██╗███╗   ██╗     #\n" 
        ++"#        ╚██╗ ██╔╝██╔═══██╗██║   ██║     ██║    ██║██║████╗  ██║     #\n"
        ++"#         ╚████╔╝ ██║   ██║██║   ██║     ██║ █╗ ██║██║██╔██╗ ██║     #\n"
        ++"#          ╚██╔╝  ██║   ██║██║   ██║     ██║███╗██║██║██║╚██╗██║     #\n"
        ++"#           ██║   ╚██████╔╝╚██████╔╝     ╚███╔███╔╝██║██║ ╚████║     #\n"    
        ++"#           ╚═╝    ╚═════╝  ╚═════╝       ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝     #\n"
        ++"#                                                                    #\n"
        ++"######################################################################")
    
    loseMessage:: IO()
    loseMessage = do
            putStrLn ("\n"
        ++"###############################################################################\n"
        ++"#                                                                             #\n"
        ++"#        ██╗   ██╗ ██████╗ ██╗   ██╗    ██╗      ██████╗ ███████╗███████╗     #\n"
        ++"#        ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║     ██╔═══██╗██╔════╝██╔════╝     #\n"
        ++"#         ╚████╔╝ ██║   ██║██║   ██║    ██║     ██║   ██║███████╗█████╗       #\n"
        ++"#          ╚██╔╝  ██║   ██║██║   ██║    ██║     ██║   ██║╚════██║██╔══╝       #\n"
        ++"#           ██║   ╚██████╔╝╚██████╔╝    ███████╗╚██████╔╝███████║███████╗     #\n"
        ++"#           ╚═╝    ╚═════╝  ╚═════╝     ╚══════╝ ╚═════╝ ╚══════╝╚══════╝     #\n"
        ++"#                                                                             #\n"
        ++"###############################################################################\n")
