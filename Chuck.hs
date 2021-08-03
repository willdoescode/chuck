{-# LANGUAGE DeriveGeneric #-}

module Main where

import Control.Lens ((^.))
import Data.Aeson (FromJSON)
import GHC.Generics (Generic)
import Network.Wreq (asJSON, get, responseBody)

data Chuck = Chuck
  { icon_url :: String,
    id :: String,
    url :: String,
    value :: String
  }
  deriving (Show, Generic)

instance FromJSON Chuck

main :: IO ()
main =
  ( (asJSON =<< get "https://api.chucknorris.io/jokes/random")
      >>= \r -> return $ r ^. responseBody
  )
    >>= putStrLn . value
