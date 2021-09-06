personagem = love.graphics.newImage('img/pessoa.png')
bola = love.graphics.newImage('img/bola.png')
fundo = love.graphics.newImage('img/cenario.jpeg')

x, y, x2, y2 = 200, 300, 600, 300

function love.update( dt )
    if love.keyboard.isDown( 'left' ) then
        x = x - 100 * dt
    end

    if love.keyboard.isDown( 'right' ) then
        x = x + 100 * dt
    end
end

function love.draw()
    -- personaliza tamanho e escala do fundo
    love.graphics.push()
    love.graphics.scale(2.75, 3.52)
    love.graphics.draw( fundo, 0, 0 )
    love.graphics.pop()

    love.graphics.draw( personagem, x, y, 0, 1, 1, 30, 30 )
    love.graphics.draw( bola, x2, y2, 0, 1, 1, 24, 24 )
end

function math.dist( x1, y1, x2, y2)
    return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ 0.5
end
