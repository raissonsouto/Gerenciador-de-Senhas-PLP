module UserJsonHandler where
    import qualified Data.ByteString.Lazy as B

    jsonFile :: FilePath
    jsonFile = "User.json"

    getJSON :: IO B.ByteString
    getJSON = B.readFile jsonFile

    isUserRegistered::String->Bool
    isUserRegistered usernmae = True

    getStats::String->[Int]
    getStats username = [1,1,1,1]

    showStats::[Int]->IO()
    showStats estatisticas = do
        putStrLn ("veja essa incrivel estatistica!")

    addUser::String->Bool
    addStats username = True
        -- 


    addStats::String->Bool
    addStats username = True
        -- vai mexer no json do usuario adicionando dados de novas partidas.