class ChopperDropper::Components::Spatial
  attr_accessor :x, :y, :x_velocity, :y_velocity

  def initialize(x, y, x_velocity, y_velocity)
    @x = x
    @y = y
    @x_velocity = x_velocity
    @y_velocity = y_velocity
  end
end
