$LOAD_PATH << File.expand_path("../../lib", __FILE__)
require "java"
require "lwjgl.jar"
require "slick.jar"

java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException

class Game < BasicGame
  # Entities
  attr_accessor :chopper

  # Systems
  attr_accessor :input_system

  def init(container)
    @entity_manager = ChopperDropper::EntityManager.new
    @chopper = ChopperDropper::Entity.new
    @input_system = ChopperDropper::Systems::Input.new(entity_manager, container.get_input)
  end

  def update(container, delta)
    input = container.get_input

  end

  def render(container, graphics)
    graphics.set_background(Color.white)
  end
end

app = AppGameContainer.new(Game.new("Chopper Dropper"))
app.set_display_mode(512, 384, false)
app.start
