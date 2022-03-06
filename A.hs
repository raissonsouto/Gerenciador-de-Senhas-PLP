import Data.Aeson
import Control.Monad (MonadPlus(mzero))
import Data.ByteString hiding (getLine, putStrLn)
import Data.ByteString.Lazy hiding (getLine, putStrLn)

data User =
  User { username :: String,
    qtdTentativas :: Int,
    qtdDeVitorias :: Int,
    sequenciaDeVitorias :: Int,
    maiorSequenciaDeVitorias :: Int,
    distribuicaoDeTentativasCorretas :: [Int]
  } deriving Show

instance FromJSON User where
  parseJSON (Object v) =
    User <$> v .: "username"
         <*> v .: "qtdDeTentativas"
         <*> v .: "qtdDeVitorias"
         <*> v .: "sequenciaDeVitorias"
         <*> v .: "maiorSequenciaDeVitorias"
         <*> v .: "distribuicaoDeTentativasCorretas"
  parseJSON _ = mzero

instance ToJSON User where
  toJSON (User username qtdTentativas qtdDeVitorias sequenciaDeVitorias maiorSequenciaDeVitorias distribuicaoDeTentativasCorretas) =
    object ["username" .= username,
            "qtdTentativas" .= qtdTentativas,
            "sequenciaDeVitorias" .= sequenciaDeVitorias,
            "maiorSequenciaDeVitorias" .= maiorSequenciaDeVitorias,
            "distribuicaoDeTentativasCorretas" .= distribuicaoDeTentativasCorretas]

main::IO()
main = do
  usu <- getLine
  let usuario = usu
  putStrLn $ "Encode: " ++ (show (encode (User {username = usuario, qtdTentativas = 0, qtdDeVitorias = 0, sequenciaDeVitorias = 0, maiorSequenciaDeVitorias = 0, distribuicaoDeTentativasCorretas=[0,0,0,0,0,0,0]})))
  putStrLn $
    "Decode: "
      ++ (show (decode "{ \"username\": \"usuario\", \"qtdTentativas\": 0, \"qtdDeVitorias\": 0, \"sequenciaDeVitorias\": 0, \"maiorSequenciaDeVitorias\": 0, \"distribuicaoDeTentativasCorretas\": [0,0,0,0,0,0] }" :: Maybe User))