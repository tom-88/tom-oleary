{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_personal_page (
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

bindir     = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/bin"
libdir     = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/lib/x86_64-osx-ghc-8.6.5/personal-page-0.1.0.0-LPeSo0l9E9oHeOEpmCc5g1-site"
dynlibdir  = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/share/x86_64-osx-ghc-8.6.5/personal-page-0.1.0.0"
libexecdir = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/libexec/x86_64-osx-ghc-8.6.5/personal-page-0.1.0.0"
sysconfdir = "/Users/tomoleary1/Documents/projects/personal_page/personal_page_hakyll/personal-page/.stack-work/install/x86_64-osx/022837a294498af96e56ec3c1dad3992960a808ce34cb5e29c607e227474c857/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "personal_page_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "personal_page_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "personal_page_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "personal_page_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "personal_page_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "personal_page_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
