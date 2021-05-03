-- File : style.hs
-- Project : personal page in Haskell
-- Author : Tom O'Leary
-- Licence : GPL-3.0+

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (div, rem, all)

import Clay

import qualified Clay.Media as Media

import qualified Clay.Flexbox as CF

import Data.Text (Text)


main :: IO()

main = 
    putCss basic

basic :: Css
basic = do
    -- html
    html ? do
        fontSize $ pct 62.5

    body ? do
        fontSize $ rem 1.6
        color $ rgb 0 0 0 
        centered
       
        -- Display
        display flex
        flexFlow column CF.nowrap
        alignItems stretch

 --   header ? do
 --       borderBottom solid (rem 0.2) (rgb 0 0 0)

    nav ? do
        textAlign (alignSide sideRight)
        fontSize $ rem 1.8
        fontWeight bold
        color $ rgb 0 0 0 
        textDecoration none
        textTransform uppercase

--    footer ? do
--        marginTop $ rem 3
--        padding 0 0 (rem 1.2) (rem 1.2)
--        borderTop solid (rem 0.2) (rgb 0 0 0)
--        fontSize $ rem 1.2
--        color $ rgb 5 5 5
 
    footer ? do
       marginTop $ rem 3
       padding 0 0 (rem 1.2) (rem 1.2)
       fontSize $ rem 1.2
       color $ rgb 5 5 5

   
    h1 ? do
        fontSize $ rem 2.4
    
    h2 ? do
        fontSize $ rem 2

    article |> ".header" ? do
        fontSize $ rem 1.4 
        fontStyle italic
        color $ rgb 5 5 5

    div |> ".logo" ? do
        fontSize $ rem 500
        fontWeight bold
        color $ rgb 4 1 0
        textDecoration none 
    
    ".container" ? do
        position relative
        width $ pct 50

    ".image" ? do
        display block   
        width $ pct 100
        height auto

    ".overlay" ? do
        position absolute  
        bottom $ pct 100
        left $ px 0
        right $ px 0
        backgroundColor (rgb 255 255 255)
        overflow hidden
        width $ pct 200
        height $ px 0
        transition "all" (sec 0.5) ease (sec 0)

    ".container" # hover |> ".overlay" ? do
        bottom $ px 0
        height $ pct 100

    ".text" ? do
        whiteSpace nowrap
        color (rgb 0 0 0)
        fontSize $ px 20
        position absolute
        overflow hidden
        top $ pct 50
        left $ pct 50
        transform (translate (pct (0-50)) (pct (0-50)))
        
--------------------------------------------------------------------------------
centered :: Css
centered =
  do box
     wide $
       do width       pageWidth
          marginLeft  auto
          marginRight auto
     narrow $
       do width       (pct 100)


-------------------------------------------------------------------------------

box :: Css
box = boxSizing borderBox

pageWidth :: (Size LengthUnit)
pageWidth = px 750

narrow :: Css -> Css
narrow = query all [Media.maxWidth pageWidth]

wide :: Css -> Css
wide = query all [Media.minWidth pageWidth]


