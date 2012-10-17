require 'rubygems'
require 'gosu'

class Ball
  def initialize(window)
    @width = window.width
    @height = window.height
    @image = Gosu::Image.new(window,"ball.png",false)
    @x = @y = 50
    @vx = @vy = 5
  end
  def move
    @x += @vx
    @y += @vy
  end
  def draw
    @image.draw(@x, @y, 1)
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