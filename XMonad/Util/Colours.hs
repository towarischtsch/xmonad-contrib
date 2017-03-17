-----------------------------------------------------------------------------
-- |
-- Module      :  XMonad.Util.Colours
-- Copyright   :  (c) 2017 towa
-- License     :  BSD3-style (see LICENSE)
--
-- Maintainer  :  towa <towa@maschinendeck.org>
-- Stability   :  unstable
-- Portability :  unportable
--
-- Provides Helper functions to load colour configuration from YAML files
--
-----------------------------------------------------------------------------
{-# LANGUAGE DeriveGeneric #-}

module XMonad.Util.Colours
    (Colours
    (base_00
    ,base_01
    ,base_02
    ,base_03
    ,base_04
    ,base_05
    ,base_06
    ,base_07
    ,red
    ,orange
    ,yellow
    ,green
    ,aqua
    ,blue
    ,purple
    ,brown
    )
    , loadColours
    ) where

import qualified Data.ByteString.Char8 as BS
import qualified Data.Yaml as Y
import GHC.Generics
import Data.Aeson
import Data.Aeson.Types

instance FromJSON Colours
data Colours = Colours  { base_00   :: String
                        , base_01   :: String
                        , base_02   :: String
                        , base_03   :: String
                        , base_04   :: String
                        , base_05   :: String
                        , base_06   :: String
                        , base_07   :: String
                        , red       :: String
                        , orange    :: String
                        , yellow    :: String
                        , green     :: String
                        , aqua      :: String
                        , blue      :: String
                        , purple    :: String
                        , brown     :: String }
                deriving (Show, Generic)

defaultClr = Colours {  base_00 = "#2f1e2e",
                        base_01 = "#41323f",
                        base_02 = "#4f424c",
                        base_03 = "#776e71",
                        base_04 = "#8d8687",
                        base_05 = "#a39e9b",
                        base_06 = "#b9b6b0",
                        base_07 = "#e7e9db",
                        red =     "#ef6155",
                        orange =  "#f99b15",
                        yellow =  "#fec418",
                        green =   "#48b685",
                        aqua =    "#5bc4bf",
                        blue =    "#06b6ef",
                        purple =  "#815ba4",
                        brown =   "#e96ba8" }

loadColours :: String -> IO(Colours)
loadColours path = do
    conf <- BS.readFile path
    let parsedConf = Y.decode conf :: Maybe Colours
    case parsedConf of
        Nothing -> return defaultClr
        (Just clr) -> return clr
    
