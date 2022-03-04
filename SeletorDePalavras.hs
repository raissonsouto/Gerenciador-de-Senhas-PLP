module SeletorDePalavras where 
    import System.IO

    selectWord :: IO()
    selectWord = do
        json <- openFile "palavras.json" ReadMode
        numFile <- openFile "num.txt" ReadWriteMode
        arr <- hGetLine json
        num <- hGetLine numFile
        hClose json
        let a = read arr :: [String]
        let n = read num :: Int
        hClose numFile
        writeFile "num.txt" (show ((n + 1) `mod` length a))
        (a !! n)