-- File : style.hs
-- Project : personal page in Haskell
-- Author : Tom O'Leary
-- Licence : GPL-3.0+

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (div, rem)

import Clay

import qualified Clay.Media as Media

import qualified Clay.Flexbox as CF

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
        
        -- Display
        display flex
        flexFlow column CF.nowrap
        alignItems stretch

    header ? do
        borderBottom solid (rem 0.2) (rgb 0 0 0)

    nav ? do
        textAlign (alignSide sideRight)
        fontSize $ rem 1.8
        fontWeight bold
        color $ rgb 0 0 0 
        textDecoration none
        textTransform uppercase

    footer ? do
        marginTop $ rem 3
        padding 0 0 (rem 1.2) (rem 1.2)
        borderTop solid (rem 0.2) (rgb 0 0 0)
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

    div |>".logo" |> a ? do
    fontWeight bold
    color $ rgb 0 0 0
    textDecoration none 
    
    container ? do
        position relative
        width $ pct 50

    
