module Services.MySample
  ( Flock(..)
  )
where

import Protolude
import Control.Monad.Catch                          ( MonadCatch, MonadThrow )
import Domain.Service.Sample.Errors                 ( SampleError )
import Domain.Service.Sample.SampleRoute            ( MonadSampleRoute (..) )
import qualified Domain.SampleRoute                 as SampleRoute


newtype Flock a = FlockT
  { runFlock :: ExceptT SampleError IO a
  }
  deriving newtype (MonadError SampleError)
  deriving newtype Applicative
  deriving newtype MonadCatch 
  deriving newtype MonadThrow
  deriving newtype Functor
  deriving newtype Monad
  deriving newtype MonadIO


instance MonadSampleRoute Flock where
    sampleRoute                     = SampleRoute.sampleRoute
