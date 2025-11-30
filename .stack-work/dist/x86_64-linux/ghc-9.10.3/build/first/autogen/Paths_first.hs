{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_first (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/bin"
libdir     = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/lib/x86_64-linux-ghc-9.10.3-b4c3/first-0.1.0.0-5SOKOEVKYlHBtclGjIerl5-first"
dynlibdir  = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/lib/x86_64-linux-ghc-9.10.3-b4c3"
datadir    = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/share/x86_64-linux-ghc-9.10.3-b4c3/first-0.1.0.0"
libexecdir = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/libexec/x86_64-linux-ghc-9.10.3-b4c3/first-0.1.0.0"
sysconfdir = "/home/womackow/haskel_projects/first/.stack-work/install/x86_64-linux/78589a65c03d208b5c06b24a6163dad80827837b5c576e667782ab2a42776640/9.10.3/etc"

getBinDir     = catchIO (getEnv "first_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "first_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "first_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "first_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "first_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "first_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
