import System.IO

main :: IO()
main = do
    json <- openFile "palavras.json" ReadMode
    numFile <- openFile "num.txt" ReadWriteMode
    arr <- hGetLine json
    num <- hGetLine numFile
    hClose json
    let a = read arr :: [String]
    let n = read num :: Int
    hClose numFile
    writeFile "num.txt" (show ((n + 1) `mod` length a))
    print (a !! n)