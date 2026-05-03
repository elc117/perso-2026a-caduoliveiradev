module Main where

import LogicaScramble (buscarDesafio, conferir) -- Importa as tuas funções

-- aqui serão testadas as funções do LogicaScramble, verificando se elas estão funcionando corretamente.
-- os testes incluem verificar se a função buscarDesafio retorna a palavra correta para um nível específico,
-- e se a função conferir retorna True para a resposta correta e False para uma resposta incorreta

main :: IO ()
main = do
    putStrLn "testes:"

    -- teste 1: verificar se a função buscarDesafio retorna a palavra correta para o nível 1
    let teste1 = buscarDesafio 1 == "lelkahs"
    putStrLn $ "Teste 1 (Buscar Nível 1): " ++ (if teste1 then "PASSOU" else "FALHOU")

    -- teste 2: verificar se a função conferir retorna True para a resposta correta do nível 1
    let teste2 = conferir 1 "haskell" == True
    putStrLn $ "Teste 2 (Conferir Resposta Correta): " ++ (if teste2 then "PASSOU" else "FALHOU")

    -- teste 3: verificar se a função conferir retorna False para uma resposta incorreta do nível 1
    let teste3 = conferir 1 "python" == False
    putStrLn $ "Teste 3 (Conferir Resposta Errada): " ++ (if teste3 then "PASSOU" else "FALHOU")

    -- teste 4: verificar se a função buscarDesafio retorna a mensagem de fase inválida para um nível inexistente
    let teste4 = buscarDesafio 99 == "fase invalida (digite 1,2 ou 3)"
    putStrLn $ "Teste 4 (Nível Inválido): " ++ (if teste4 then "PASSOU" else "FALHOU")
