-- http://stackoverflow.com/questions/712696/is-there-a-quick-starting-haskell-interpreter-suitable-for-scripting
-- exec it with runhaskell ghc-compiled-script ghc-compiled-script to prepare binary executable 
-- TODO: cleanup .o and .hi files after compilation (maybe useless for complicated apps)
import Control.Monad
import System
import System.Directory
import System.IO
import System.Posix.Files
import System.Posix.Process
import System.Process

getMTime f = getFileStatus f >>= return . modificationTime

main = do
  scr : args <- getArgs
  let cscr = takeWhile (/= '.') scr

  scrExists <- doesFileExist scr
  cscrExists <- doesFileExist cscr
  compile <- if scrExists && cscrExists
               then do
                 scrMTime <- getMTime scr
                 cscrMTime <- getMTime cscr
                 return $ cscrMTime <= scrMTime
               else
                   return True

  when compile $ do
         r <- system $ "ghc --make " ++ scr
         case r of
           ExitFailure i -> do
                   hPutStrLn stderr $
                            "'ghc --make " ++ scr ++ "' failed: " ++ show i
                   exitFailure
           ExitSuccess -> return ()

  executeFile cscr False args Nothing
