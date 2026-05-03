{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Text.Lazy (pack)
import LogicaScramble (buscarDesafio, conferir)

main :: IO ()
main = scotty 3000 $ do
    
    get "/" $ do
        text "Bem-vindo ao jogo Scramble feito em Haskell! \nPara jogar coloque /jogar/nivel (exemplo: /jogar/1 , para jogar o nivel 1).\nNo momento temos as fases de 1 até 5, com sua dificuldade aumentando a cada fase.\nPara chutar a resposta, coloque /chute/nivel/palavra (exemplo: /chute/1/python).\nBoa sorte!"
    get "/jogar/:nivel" $ do
        n <- pathParam "nivel" :: ActionM Int
        -- chama função buscarDesafio para obter a palavra embaralhada
        let desafio = buscarDesafio n
        text $ pack $ "Aviso: Caso nao saiba a palavra adicione no url /nivel/dica.\nPalavra embaralhada: " ++ desafio
        -- adicionei dicas pra cada nivel, para ajudar o jogador caso ele esteja com dificuldade, as dicas estão relacionadas com o curso e o conteúdo que estamos estudando, exceto a dica do nivel 5 que é só pra diversão mesmo.
    get "/:nivel/dica" $ do
        n <- pathParam "nivel" :: ActionM Int
        let dica = case n of
                    1 -> "Dica: É uma linguagem de programação funcional que aprendemos no inicio do curso."
                    2 -> "Dica: É conhecida por sua simplicidade e por ser uma das linguagens mais populares hoje em dia."
                    3 -> "Dica: É o que estamos mais estudando programação ______."
                    4 -> "Dica: É a palavra que mais representa o curso."
                    5 -> "Dica: Essa palavra nao tem nada a ver com o curso nem nada, é so pra diversão."
                    _ -> "Dica indisponível para este nível."
        text $ pack dica

    -- rota do chute, onde o usuário envia o nível e a palavra que acha que é a resposta correta
    get "/chute/:nivel/:palavra" $ do
        n <- pathParam "nivel"   :: ActionM Int
        p <- pathParam "palavra" :: ActionM String
        -- chamar função conferir para verificar se o chute do usuário está correto
        let acertou = conferir n p
        
        if acertou
            then text "Parabens! Voce acertou a palavra."
            else text "Errou! Tente de novo."