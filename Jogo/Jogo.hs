import System.IO

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
        jogo (tentativas:correcao) recursao
    else do
        --tentativas ++ newGuess
        if False then putStrLn "Voce ganhou!" -- colocar guessChecker no lugar do False
        else if recursao > 3 then putStrLn "Você perdeu!"
        else jogo (tentativas:correcao) (recursao+1)
    
main::IO()
main = jogo [[],[]] 0