import Data.Aeson
import GHC.Generics

data User =
  User { username::!Text
         , qtdTentativas::Int
         , qtdDeVitorias::Int
         , sequenciaDeVitorias::Int
         , maiorSequenciaDeVitorias::Int
         , distribuicaoDeTentativasCorretas::[Int]
           } deriving (Show, Generic)

instance FromJSON User
instance ToJSON User