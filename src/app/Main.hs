module Main where

import Protolude
import Servant hiding                          ( Context )
import Network.Wai.Middleware.RequestLogger    ( mkRequestLogger )
import Data.Default                            ( def )
import Domain.Service.Sample.Http.Api          ( api )
import Http.Server                             ( server )
import Network.Wai.Handler.Warp                ( runSettings, defaultSettings, setPort )
main :: IO ()
main = do
    logger <- mkRequestLogger def

    let app = serve api server
    let middleware = logger

    let port = 5003
    let settings = setPort port defaultSettings

    putText "Example Server Running..."
    runSettings settings . middleware $ app
