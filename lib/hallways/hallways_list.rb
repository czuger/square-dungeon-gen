class HallwaysList

  def initialize
    @hallways = {}
  end

  def connect_rooms( r1, r2, hallway )
    @hallways[ [ r1.top_left_array, r2.top_left_array ] ] = hallway
    hallway.set_draw_base_room( r1 )
  end

  def draw( gc )
    @hallways.each_pair{ |_, h| h.draw( gc ) unless h.disabled }
  end

end