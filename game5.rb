require 'rubygems'
require 'gosu'

class Ball
  def initialize(window)
    @width = window.width
    @height = window.height
    @image = Gosu::Image.new(window,"ball.png",false)
    @x = @y = 50
    @vx = @vy = 5
    @window = window
  end
  def move
    @x += @vx
    @y += @vy
    if @y > @window.height - @image.height
      @vy = -5
    end
    if @x > @window.width - @image.width
      @vx = -5
    end
    if @x < 0
      @vx = 5
    end
    if @y < 0
      @vy = 5
    end
    
  end
  def draw
    @image.draw(@x, @y, 1)
  end
end
class Paddle
  def initialize(window)
    
  end
    
  
end

class GameWindow < Gosu::Window
  
  def initialize
    super 640,480,false
    self.caption = "Learning Gosu"
    @ball = Ball.new(self)
  end
  
  def update
    @ball.move
  end
  
  def draw
    @ball.draw  
  end
end

window = GameWindow.new
window.show