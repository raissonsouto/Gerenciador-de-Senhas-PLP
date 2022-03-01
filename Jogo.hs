#   (task) fazer um algoritmo que fala se a palavra esta certa ou se
#   tem letras corretas e em posições corretas
guessChecker::String->Bool
guessChecker guess = do
    if guess == "teste"
    then True
    else False

#   OBS: a assinatura vai ter que mudar para se adaptar ao guessChecker

jogo::String->Int->IO()
jogo historico recursao = do

    guess <- getLine

    let result = guessChecker guess
    if result 
    then do
        putStrLn "Voce acertou"

    else if recursao > 3 && result /= True
    then putStrLn "Se fodeu"
    else do
        jogo "" (recursao+1)
    
    
main::IO()
main = jogo "" 0
