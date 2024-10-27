
-- Iniciação
local palavrasecreta = {"b","a","n","a","n","a"}
local palavravisivel = {"_","_","_","_","_","_"}
local palavraserradas = {}
local ipe = 0
local vidas = 6
local ganhou = false
local checagem = 0
local checagemdevitoria = false

-- Loop enquanto o jogador nao ganhou

while(ganhou == false) do
    
    -- Loop para mostrar as palavras visiveis
    for i = 1, #palavravisivel do
        io.write(palavravisivel[i])
    end
    io.write("\n")

    -- Pergunta Um Palpite
    io.write("Insira um Palpite: ")
    local palpite = io.read("l")

    -- Loop de verificação
    for i = 1, #palavrasecreta, 1 do
        if(palavrasecreta[i] == palpite) then
            palavravisivel[i] = palpite
            checagem = 1
        end
    end
    -- Verificação Se Ele nao acertou
    if(checagem ~= 1) then
        print("Nada")
        vidas = vidas - 1
        ipe = ipe + 1
        palavraserradas[ipe] = palpite
        for i=1,#palavraserradas do
            io.write("Palavras Erradas: "..palavraserradas[i]..", ")
        end
        io.write("\n")
    end
    print("Numero de vidas: "..vidas)

    -- Checagem se o jogador venceu
    for i=1,#palavrasecreta, 1 do
        if(palavrasecreta[i] ~= palavravisivel[i]) then
            checagemdevitoria = false
            break
        elseif(palavrasecreta[i] == palavravisivel[i]) then
            checagemdevitoria = true
        end
    end

    -- Venceu ou Nao?
    if(checagemdevitoria == true) then
        for i = 1, #palavravisivel, 1 do
            io.write(palavravisivel[i])
        end
        io.write("\n")
        print("Voce Venceu! Parabens!")
        ganhou = true
    end

    -- Verifica se o numero de vidas é valido
    if(vidas < 1) then
        ganhou = true
        print("Voce Perdeu!")
    end

        checagem = 0
end