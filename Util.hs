color :: String -> Bool -> String -> String
color "red"     bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[31m" ++ texto ++ "\ESC[0m"
color "green"   bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[32m" ++ texto ++ "\ESC[0m"
color "yellow"  bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[33m" ++ texto ++ "\ESC[0m"
color "blue"    bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[34m" ++ texto ++ "\ESC[0m"
color "white"   bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[37m" ++ texto ++ "\ESC[0m"