module VerificaPalavra where
    import System.IO
    verificaPalavra :: String -> IO Bool
    verificaPalavra palavra = do
        json <- openFile "palavras.json" ReadMode
        arr <- hGetLine json
        hClose json
        let a = read arr :: [String]
        return (palavra `elem` a)
