{-# LANGUAGE OverloadedStrings #-}
module Controllers where

import Models

import Web.Scotty as S

import Data.Text.Lazy
import Data.Monoid

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text

import Control.Monad (forM_)
import Control.Monad.IO.Class (liftIO)

import Database.Esqueleto as E (select, from, insert, Entity)

html' = S.html . renderHtml . docTypeHtml

router = do
    get "/" $ do
      patients <- liftIO $ runDB $ E.select $
                                   from $ \p -> return p
      html' $ do
        H.head $
          H.title "SGMP: Patient Data Tracker"
        H.body $ do
          h1 "SGMP Patient Data Tracker"
          H.form ! action "/add" ! method "post" $ do
            input ! name "name" ! placeholder "Patient name"
            input ! type_ "submit" ! value "Submit"
          ul $ forM_ (patients :: [Entity Patient]) $
                 li . toHtml . show

    post "/add" $ do
      name <- S.param "name"
      liftIO $ runDB $ insert $ Patient name
      redirect "/"
