{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_mysample_sample (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/bin"
libdir     = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/lib/x86_64-osx-ghc-8.8.3/mysample-sample-0.1.0.0-LCaE027bseT35KGw88CSv2-mysample-sample-exe"
dynlibdir  = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/share/x86_64-osx-ghc-8.8.3/mysample-sample-0.1.0.0"
libexecdir = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/libexec/x86_64-osx-ghc-8.8.3/mysample-sample-0.1.0.0"
sysconfdir = "/Users/skilurus/github/minimal-example/.stack-work/install/x86_64-osx/2a4c3ef00ec7985477efcf14a781c1025546543f5369b28a7332f1f927b8a81f/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mysample_sample_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mysample_sample_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "mysample_sample_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "mysample_sample_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mysample_sample_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mysample_sample_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
