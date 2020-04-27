module Domain.Service.Sample.SampleRoute
  ( MonadSampleRoute (..),
  execute
  )
where
  
import Protolude    
  
  ---------------------------------------------------------------------------------------------------------
  
class Monad m => MonadSampleRoute m where
    sampleRoute :: m ByteString
  
  ---------------------------------------------------------------------------------------------------------
  
execute 
    :: MonadSampleRoute m
    => m ByteString

execute = sampleRoute