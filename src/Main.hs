{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  print args
  let port = case args of
               [p] -> read p
               _   -> 3000
  scotty port $
    get "/" $
      html "Hello world!"
