import Data.Aeson
import GHC.Generics
import Data.ByteString hiding (getLine, putStrLn)
import Data.ByteString.Lazy hiding (getLine, putStrLn)

data User =
  User { username :: !Text
         , qtdTentativas::Int
         , qtdDeVitorias::Int
         , sequenciaDeVitorias::Int
         , maiorSequenciaDeVitorias::Int
         , distribuicaoDeTentativasCorretas::[Int]
           } deriving (Show, Generic)

instance FromJSON User
instance ToJSON User