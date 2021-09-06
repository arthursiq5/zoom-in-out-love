require "camera"

personagem = love.graphics.newImage('img/pessoa.png')
bola = love.graphics.newImage('img/bola.png')
fundo = love.graphics.newImage('img/cenario.jpeg')

x, y, x2, y2 = 200, 300, 600, 300
tamanho = 1

function love.update( dt )
    if love.keyboard.isDown( 'left' ) then
        x = x - 100 * dt
    end

    if love.keyboard.isDown( 'right' ) then
        x = x + 100 * dt
    end

    if math.dist(x, y, x2, y2) < 200 then
        tamanho = tamanho + 0.5 * dt
        if tamanho >= 1.5 then
            tamanho = 1.5
        end
    else
        tamanho = tamanho - 0.5 * dt
        if tamanho <= 1 then
            tamanho = 1
        end
    end
end

function love.draw()

    camera:set()

    love.graphics.scale( tamanho )
    love.graphics.translate( - (x - 100), - (y - 300))
    -- personaliza tamanho e escala do fundo
    love.graphics.push()
    love.graphics.scale(4, 4)
    love.graphics.draw( fundo, 0, 0 )
    love.graphics.pop()

    love.graphics.draw( personagem, x, y, 0, 1, 1, 30, 30 )
    love.graphics.draw( bola, x2, y2, 0, 1, 1, 24, 24 )

    camera:unset()
end

function math.dist( x1, y1, x2, y2)
    return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ 0.5
end
