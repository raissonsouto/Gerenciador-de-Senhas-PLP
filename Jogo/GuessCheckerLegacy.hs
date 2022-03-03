module GuessChecker where

    lettersChecker::Char->Char->Bool
    lettersClassifier guessLetter correctLetter = do
        if guessLetter == correctLetter then True
        else False

    checkLetterWithCWord::Char->String->Int->Int->String
    checkLetterWithCWord guessLetter (correctLetter:otherCorrects) glIndex cwIndex = do
        if lettersChecker guessLetter correctLetter && glIndex == cwIndex then "V"
        else if lettersChecker guessLetter correctLetter then "E"
        else "X"


    guessChecker::String->[[String]]->[[String]]
    guessChecker newGuess tentativas = do

        lettersClassifier newGuess
        if newGuess == "teste" then True
        else False

    --guessAnswer::[[String]]->Bool
    --guessAnswer texto = do
