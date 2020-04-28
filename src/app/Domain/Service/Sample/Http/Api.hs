module Domain.Service.Sample.Http.Api
  ( Api, api )
where

import Protolude
import Servant.API
import Domain.Service.Sample.Http.Routes.SampleRoute ( SampleRoute )

type Health = "health" :> GetNoContent '[PlainText] NoContent

type Api = Health
  :<|> SampleRoute

api :: Proxy Api
api = Proxy
