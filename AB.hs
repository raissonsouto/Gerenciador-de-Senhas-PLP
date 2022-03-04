colorir :: String -> String -> String -> String
colorir guess answer res
    | guess == [] = res
    | (head answer) == 'V' = colorir (tail guess) (tail answer) (res ++ "\ESC[32m" ++ ((head guess) : []))
    | (head answer) == 'A' = colorir (tail guess) (tail answer) (res ++ "\ESC[33m" ++ ((head guess) : []))
    | otherwise = colorir (tail guess) (tail answer) (res ++ "\ESC[0m" ++ ((head guess) : []))