module ColorfulPrint where
    charToString :: Char -> String
    charToString c = [c]

    color :: String -> String -> String
    color "red"    texto = "\ESC[0m" ++ "\ESC[31m" ++ texto ++ "\ESC[0m"
    color "green"  texto = "\ESC[0m" ++ "\ESC[32m" ++ texto ++ "\ESC[0m"
    color "yellow" texto = "\ESC[0m" ++ "\ESC[33m" ++ texto ++ "\ESC[0m"
    color "blue"   texto = "\ESC[0m" ++ "\ESC[34m" ++ texto ++ "\ESC[0m"
    color "white"  texto = "\ESC[0m" ++ "\ESC[37m" ++ texto ++ "\ESC[0m"

    textColorizer::String->String->Int->String
    textColorizer (letra:letras) (metadado:metadados) recursao = do
        if recursao < 4 then do
            if metadado == 'V' then ((color "green" (charToString letra)) ++ (textColorizer letras metadados (recursao+1)))
            else if metadado == 'E' then ((color "yellow" (charToString letra)) ++ (textColorizer letras metadados (recursao+1)))
            else ((color "red" (charToString letra)) ++ (textColorizer letras metadados (recursao+1)))
        else do
            if metadado == 'V' then ((color "green" (charToString letra)) ++ "\n")
            else if metadado == 'E' then ((color "yellow" (charToString letra)) ++ "\n")
            else ((color "red" (charToString letra)) ++ "\n")

    colorfulPrint::[String]->[String]->String
    colorfulPrint tentativas metadados
        | tentativas==[] && metadados==[] = ""
        | otherwise = (textColorizer (head tentativas) (head metadados) 0) ++ (colorfulPrint (tail tentativas) (tail metadados))