tryANewGuess::IO()->String
tryANewGuess = do
    newGuess <- getLine

    if 5 /= length newGuess
    then do
        putStr "Palavra com tamanho errado. Tente novamente: "
        tryANewGuess

    else newGuess

printJogo::[[String]]->IO()
printJogo (tentativas:resultados) = do
    print tentativas

jogo::[[String]]->Int->IO()
jogo tentativas recursao = do

    printJogo tentativas

    let newGuess = tryANewGuess
    let result = guessChecker newGuess tentativas

    if result then putStrLn "Voce ganhou!"
    else if recursao > 3 && result == False then putStrLn "Você perdeu!"
    else jogo (tentativas) (recursao+1)
    
    
main::IO()
main = jogo [[],[]] 0