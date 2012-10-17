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
    @x = 20
    @y = 200
    @image = Gosu::Image.new(window, "paddle.png", false)
  end
  def draw
    @image.draw(@x, @y, 1)
  end
  def move_down
    @y += 7
  end
  def move_up
    @y -= 7
  end
    
  
end

class GameWindow < Gosu::Window
  
  def initialize
    super 640,480,false
    self.caption = "Learning Gosu"
    @ball = Ball.new(self)
    @left_paddle = Paddle.new(self)
  end
  
  def update
    @ball.move
    if button_down?(Gosu::KbW)
      @left_paddle.move_up
    end
    if button_down?(Gosu::KbZ)
      @left_paddle.move_down
    end
  end
  
  def draw
    @ball.draw  
    @left_paddle.draw
  end
end

window = GameWindow.new
window.show