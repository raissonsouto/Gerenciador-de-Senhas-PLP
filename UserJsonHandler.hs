import qualified Data.ByteString.Lazy as B

jsonFile :: FilePath
jsonFile = "User.json"

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

isUserRegistered::String->Bool
isUserRegistered -- ????

getStats::String->[Int]
getStats username = do
-- ?????

showStats::[Int]->IO()
-- ????

addUser::String-> IO Bool
addUser user = do
    !userId <- fmap (length.lines) (readFile "User.json")
    us <- User <$> (putStrLn "User: " >> readLn) <*> 


