module LogicaScramble where

-- breve explicação, aqui coloquei a logica do jogo Scramble onde o usuario recebe uma palavra embaralhada 
-- e tem que adivinhar a palavra correta. A função buscarDesafio retorna a palavra embaralhada para um 
-- determinado nível, e a função conferir verifica se a resposta do usuário está correta.
-- essa é a primeira versão da lógica, será adicionada mais coisas para deixar o jogo mais legal (ex: mais fases, dicas, etc)

-- lista para as tuplas (nivel, palavra embaralhada, resposta correta)
fases :: [(Int, String, String)]
fases = [
    (1, "lelkahs", "haskell"),
    (2, "nohtyp", "python"),
    (3, "avaj", "java")
  ]

-- função para buscar o desafio (exemplo buscarDesafio 1 retorna "lelkahs")
buscarDesafio :: Int -> String
buscarDesafio n = 
    case [emb | (nivel, emb, _) <- fases, nivel == n] of
        (x:_) -> x
        []    -> "fase invalida (digite 1,2 ou 3)"

-- função para conferir a resposta do jogador (exemplo conferir 1 "haskell" retorna True)
conferir :: Int -> String -> Bool
conferir n chute =
    case [resp | (nivel, _, resp) <- fases, nivel == n] of
        (r:_) -> chute == r
        []    -> False