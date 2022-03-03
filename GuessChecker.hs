import Data.List
import Control.Monad.STM (check)
import Data.Char(isUpper)

comparator :: Char -> Char -> Char 
comparator a b
    | a == b = 'V'
    | otherwise  = a

replace i r s = [if j == i then r else c | (j, c) <- zip [0..] s]

checkUpperCase :: Char -> [Char] -> [Char]
checkUpperCase g r
    | isUpper g = [g]
    | otherwise = r

correctLetters :: String -> String -> Int -> String
correctLetters guess answer pos
    | pos == length guess = []
    | otherwise = do 
    let g = guess!!pos
    let posG = findIndex(==g) answer
    case posG of
        Just a -> checkUpperCase g "A" ++ correctLetters guess (replace a 'A' answer) (pos + 1)
        Nothing -> checkUpperCase g "P" ++ correctLetters guess answer (pos + 1)
        
            
correctPositions :: String -> String -> String 
correctPositions guess answer = zipWith comparator guess answer

guessChecker :: String -> String -> String
guessChecker guess answer = 
        correctLetters (correctPositions guess answer) answer 0

main :: IO()
main = print (guessChecker "esset" "teste")