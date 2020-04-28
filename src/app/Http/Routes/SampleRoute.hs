module Http.Routes.SampleRoute
  ( sampleRoute )
where

import Protolude
import Services.MySample                                        ( runSample )
import Servant.API.Stream                                       ( SourceIO )
import Servant.Server                                           ( Handler )
import qualified Servant.Types.SourceT                          as S
import Domain.Service.Sample.SampleRoute                        ( execute )
import Http.Error                                               ( internalErr )
import Domain.Service.Sample.Errors                             ( SampleError )


-- -----------------------------------------------------------------------------------------------------------------------

sampleRoute :: Handler (SourceIO ByteString)
sampleRoute = do
  putStrLn("In Route Handler"::Text)
  val <- liftIO . runExceptT . runSample $  execute
  either handleError respond val

-- ----------------------------------------------------------------------------------------------------------------------

respond :: ByteString -> Handler (SourceIO ByteString)
respond doc = return $ S.source [doc]

-- -----------------------------------------------------------------------------------------------------------------------

handleError :: SampleError -> Handler (SourceIO ByteString)
handleError err = do
  putText $ show err
  throwError $ internalErr err
