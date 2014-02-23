module Main where

import Models
import Controllers

import Web.Scotty as S
import System.Environment (getArgs)

import Database.Persist.Sqlite (runSqlite, runMigration)

main :: IO ()
main = do
  args <- getArgs
  let port = case args of
               [p] -> read p
               _   -> 3000
  runDB $ runMigration migrateTables
  scotty port router
