class ChopperDropper::EntityManager
  attr_accessor :entities

  def initialize
    @entities = Hash.new { |k,v| k[v] = {} }
  end

  def register(entity, component)
    entities[component.class][entity.uuid] ||= []
    entities[component.class][entity.uuid] << component
  end

  def with_component(type)
    entities[component_class(type)]
  end

  def component_of_entity(entity, type)
    entities[component_class(type)][entity.uuid].first
  end

  def component_class(type)
    ChopperDropper::Components.const_get(type)
  end
end
