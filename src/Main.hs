module Main where

import Control.Applicative ((<$>))

import Models
import Controllers

import Web.Scotty as S
import System.Environment (getArgs, getEnv)

import Data.ByteString.Char8 (pack)

import Database.Persist.Postgresql

main :: IO ()
main = do
  args <- getArgs
  let port = case args of
               [p] -> read p
               _   -> 3000
  connStr <- pack <$> getEnv "SGMP_CONN_STR"
  withPostgresqlConn connStr $ \conn -> do
    runSqlPersistM (runMigration migrateTables) conn
    scotty port (router conn)
