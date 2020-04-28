module Domain.SampleRoute  ( sampleRoute )
where

import Protolude hiding                                ( readFile )
import Filesystem                                      ( readFile )
import Filesystem.Path.CurrentOS                       ( fromText )
import Domain.Service.Sample.Errors                    ( SampleError )
-----------------------------------------------------------------------------------------------------------------------

sampleRoute
  :: MonadIO m
  => MonadError SampleError m
  => m ByteString

sampleRoute = liftIO $ readFile $ fromText "./tmp/sample.pdf"