module Domain.Service.Sample.Http.Routes.SampleRoute
  ( SampleRoute )
where

import Protolude
import Servant.API                            ( (:>), Capture )
import Servant.API.ContentTypes               ( OctetStream )
import Servant.API.Stream                     (NoFraming, SourceIO, StreamGet )
import Data.UUID                              ( UUID )
-----------------------------------------------------------------------------------------------------------------------
type SampleRoute
  =  "sample"
  :> "sample"
  :> Capture "primaryId" UUID
  :> StreamGet NoFraming OctetStream (SourceIO ByteString)
-----------------------------------------------------------------------------------------------------------------------
