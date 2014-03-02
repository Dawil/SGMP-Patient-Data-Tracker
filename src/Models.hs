{-# LANGUAGE OverloadedStrings, QuasiQuotes, TemplateHaskell, TypeFamilies, FlexibleContexts, GADTs #-}
module Models
where

import Control.Monad.Logger
import Control.Monad.Trans.Resource

import Data.Text.Lazy

import Database.Esqueleto
import Database.Persist.Sql
import Database.Persist.Postgresql
import Database.Persist.TH ( mkPersist
                           , mkMigrate
                           , persistLowerCase
                           , share
                           , sqlSettings
                           )

share [mkPersist sqlSettings, mkMigrate "migrateTables"] [persistLowerCase|
Patient
  name  Text
  deriving Show
|]
