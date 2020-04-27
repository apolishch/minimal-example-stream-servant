module Domain.Service.Sample.Errors
  ( SampleError (..),
    errorToText
  )
where

import Protolude

newtype SampleError = SampleError Text deriving (Show, Generic)


instance Exception SampleError

errorToText :: SampleError -> Text
errorToText (SampleError errorMessage)           = "SampleError" <> errorMessage

