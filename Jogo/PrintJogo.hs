--   (task) algoritmo que muda de cor, está associado ao guessChecker
--   usar como referencia:
--   https://github.com/lucasgsa/MinhasCadeiras/blob/master/PLP/JogosONPLP/src/Haskell/Util.hs

color :: Char -> String -> String
color "red"    texto = "\ESC[0m" ++ "\ESC[31m" ++ texto ++ "\ESC[0m"
color "green"  texto = "\ESC[0m" ++ "\ESC[32m" ++ texto ++ "\ESC[0m"
color "yellow" texto = "\ESC[0m" ++ "\ESC[33m" ++ texto ++ "\ESC[0m"
color "blue"   texto = "\ESC[0m" ++ "\ESC[34m" ++ texto ++ "\ESC[0m"
color "white"  texto = "\ESC[0m" ++ "\ESC[37m" ++ texto ++ "\ESC[0m"

printColorido::String->String->String
printColorido (letra:proximasLetra) (gabaritoDaLetra:proximosGabaritos) = do
    if gabaritoDaLetra == 'V'
    then do
        let letraCorrigida = color "green" letra
        letraCorrigida
    else if gabaritoDaLetra == 'E'
    then do
        let letraCorrigida = color "yellow" letra
        letraCorrigida
    else do
        let letraCorrigida = color "red" letra
        letraCorrigida

main::IO() 
main = do
    putStrLn printColorido "Teste" "VEXVE"
