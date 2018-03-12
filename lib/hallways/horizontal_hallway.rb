require_relative 'hallway'

class HorizontalHallway < Hallway

  HALLWAY_HEIGHT=2
  HALLWAY_WIDTH=4

  def draw( gc, base_room, x_decal = 0 )
    min_x = base_room.max_x - x_decal
    max_x = min_x + HALLWAY_WIDTH * SQUARE_SIZE_IN_PIXELS - x_decal

    min_y = base_room.min_y + ( Room::ROOM_SQUARE_SIZE/2-1 ) * SQUARE_SIZE_IN_PIXELS
    max_y = min_y + HALLWAY_HEIGHT * SQUARE_SIZE_IN_PIXELS

    super( gc, HALLWAY_WIDTH, HALLWAY_HEIGHT, min_x, max_x, min_y, max_y )
  end

  def draw_from_base_room( gc )
    draw( gc, @draw_base_room )
  end

  def draw_right_from_given_room( gc, room )
    draw( gc, room )
  end

  def draw_left_from_given_room( gc, room )
    draw( gc, room, ( HALLWAY_WIDTH + Room::ROOM_SQUARE_SIZE ) * SQUARE_SIZE_IN_PIXELS )
  end

end