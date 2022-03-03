module Jogo where

    import System.IO
    import ColorfulPrint
    import GuessChecker
    import SeletorDePalavras

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
            let newTentativas = (tentativas ++ newGuess)
            let metadado = guessChecker  selectWord
            let newMetadados = (metadados ++ metadado)

            putStrLn (colorfulPrint tentativas metadados)
            
            if metadado == "VVVVV" then putStrLn "Voce ganhou!"
            else if recursao > 3 then putStrLn "Você perdeu!"
            else jogo (tentativas:metadados) (recursao+1)
