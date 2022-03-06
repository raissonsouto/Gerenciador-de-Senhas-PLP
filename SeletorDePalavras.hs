module SeletorDePalavras where
    import System.IO
    import System.Random
        
    selectorWord::IO String
    selectorWord = do
        json <- openFile "palavras.json" ReadMode
        arr <- hGetLine json
        hClose json
        let a = read arr :: [String]    
        n <- randomRIO(0,(length a)-1)
        return (a !! n)