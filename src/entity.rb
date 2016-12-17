module ChopperDropper
  class Entity
    attr_reader :uuid

    def initialize
      @uuid = java.util.UUID.randomUUID.to_s
    end
  end
end
