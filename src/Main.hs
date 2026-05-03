{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Text.Lazy (pack)
import LogicaScramble (buscarDesafio, conferir)

main :: IO ()
main = scotty 3000 $ do
    
    get "/" $ do
        text "Bem-vindo ao Scramble! Acesse /jogar/1 para ver a primeira fase (tem que colocar no final do url)."

    get "/jogar/:nivel" $ do
        n <- pathParam "nivel" :: ActionM Int
        -- chama função buscarDesafio para obter a palavra embaralhada
        let desafio = buscarDesafio n
        text $ pack $ "Palavra embaralhada: " ++ desafio

    -- rota do chute, onde o usuário envia o nível e a palavra que acha que é a resposta correta
    get "/chute/:nivel/:palavra" $ do
        n <- pathParam "nivel"   :: ActionM Int
        p <- pathParam "palavra" :: ActionM String
        -- chamar função conferir para verificar se o chute do usuário está correto
        let acertou = conferir n p
        
        if acertou
            then text "Parabens! Voce acertou a palavra."
            else text "Errou! Tente de novo."