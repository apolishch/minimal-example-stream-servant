module Http.Server
  ( server )
where

import Protolude
import Servant hiding                          ( Context )
import Domain.Service.Sample.Http.Api                 ( Api )
import Http.Routes.SampleRoute                 ( sampleRoute )

server :: Server Api
server = health :<|> sampleRoute

health :: Handler NoContent
health = return NoContent
