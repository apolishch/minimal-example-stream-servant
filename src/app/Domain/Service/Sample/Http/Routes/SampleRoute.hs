module Domain.Service.Sample.Http.Routes.SampleRoute
  ( SampleRoute )
where

import Protolude
import Servant.API                            ( (:>) )
import Servant.API.ContentTypes               ( OctetStream )
import Servant.API.Stream                     (NoFraming, SourceIO, StreamGet )

-----------------------------------------------------------------------------------------------------------------------
type SampleRoute
  =  "sample"
  :> StreamGet NoFraming OctetStream (SourceIO ByteString)
-----------------------------------------------------------------------------------------------------------------------
