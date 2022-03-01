import System.IO

prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    input <- getLine
    let inputStr = read input::String
    inputStr

playGame::String
playGame = do
    putStrLn "_ _ _ _ _"
    putStrLn "_ _ _ _ _"
    putStrLn "_ _ _ _ _"
    putStrLn "_ _ _ _ _"
    putStrLn "_ _ _ _ _"
    putStrLn ""

    let palavra = prompt "palavra: "
    palavra

main::IO()
main = do
    putStrLn "######################################################"
    putStrLn "#                                                    #"
    putStrLn "#        BEM VINDO(A) AO JOGO LETRAS CRUZADAS        #"
    putStrLn "#                                                    #"
    putStrLn "######################################################"
    putStrLn ""
    putStrLn "J - Jogar"
    putStrLn "I - Instruções"
    putStrLn "S - Sair"
    putStrLn ""

    let command = prompt ">>> "

    if command == "J" then playGame
    else playGame