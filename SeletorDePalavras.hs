module SeletorDePalavras where
    import System.IO
    import System.Random
    
    randomNopik::Int->Int
    randomNopik length = do
        randomRIO(0,length-1):: IO Int
        
    selectorWord :: IO String
    selectorWord = do
        let words = getWords
        let selectedIndex = randomNopik (length words)
        return (words !! selectedIndex)

    getWords:: [String]
    getWords = do
        json <- openFile "palavras.json" ReadMode
        arr <- hGetLine json
        hClose json
        read arr :: [String]