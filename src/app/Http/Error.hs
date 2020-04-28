module Http.Error (
  internalErr
  )
where

import Protolude
import Servant.Server                                           ( ServerError (..), err500 )
-- import qualified Servant
import Domain.Service.Sample.Errors                             ( SampleError (..) )

-----------------------------------------------------------------------------------------------------------------------

data HttpError = Internal { internalError :: !SampleError }
  deriving (Show, Generic)


-----------------------------------------------------------------------------------------------------------------------
internalErr :: SampleError -> ServerError
internalErr _ = err500
