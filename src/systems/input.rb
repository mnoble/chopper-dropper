class ChopperDropper::Systems::Input
  SPEED = 0.2
  attr_accessor :entity_manager, :input

  def initialize(entity_manager, input)
    @entity_manager = entity_manager
    @input = input
  end

  def call(delta)
    entity_manager.with_component(:KeyboardControllable).each do |entity|
      spatial = entity_manager.component_of_entity(entity, :Spatial)

      spatial.move_up(component, delta)    if up_pressed?
      spatial.move_down(component, delta)  if down_pressed?
      spatial.move_left(component, delta)  if left_pressed?
      spatial.move_right(component, delta) if right_pressed?
    end
  end

  def move_up(component, delta)
    component.y -= SPEED * delta
  end

  def move_down(component, delta)
    component.y += SPEED * delta
  end

  def move_left(component, delta)
    component.x -= SPEED * delta
  end

  def move_right(component, delta)
    component.x += SPEED * delta
  end

  def up_pressed?
    input.is_key_pressed(Input::KEY_UP)
  end

  def down_pressed?
    input.is_key_pressed(Input::KEY_DOWN)
  end

  def left_pressed?
    input.is_key_pressed(Input::KEY_LEFT)
  end

  def right_pressed?
    input.is_key_pressed(Input::KEY_RIGHT)
  end
end
