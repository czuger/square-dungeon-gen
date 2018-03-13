require_relative 'drawable_object'

class Room < DrawableObject

  SQUARES_BETWEEN_ROOMS = 4
  ROOM_SQUARE_SIZE = 8

  attr_reader :top, :left, :entry_room, :min_x, :min_y, :max_x, :max_y, :connected_hallways
  attr_accessor :room_id

  def initialize( top, left )
    @top = top
    @left = left
    @connected_hallways = {}
  end

  def top_left_array
    [ @top, @left ]
  end

  def set_entry_room
    @entry_room = true
  end

  def decal_at_origin
    @top = 1
    @left = 1
  end

  def connect_hallway( direction, hallway )
    @connected_hallways[ direction ] = hallway
  end

  def compute_coords
    @min_x = ( ( @left-1 ) * ROOM_SQUARE_SIZE + @left * SQUARES_BETWEEN_ROOMS ) * SQUARE_SIZE_IN_PIXELS
    @max_x = @min_x + ROOM_SQUARE_SIZE * SQUARE_SIZE_IN_PIXELS
    @min_y = ( ( @top-1 ) * ROOM_SQUARE_SIZE + @top * SQUARES_BETWEEN_ROOMS ) * SQUARE_SIZE_IN_PIXELS
    @max_y = @min_y + ROOM_SQUARE_SIZE * SQUARE_SIZE_IN_PIXELS
  end

  def compute_coords_at_origin
    @min_x = SQUARES_BETWEEN_ROOMS * SQUARE_SIZE_IN_PIXELS
    @max_x = @min_x + ROOM_SQUARE_SIZE * SQUARE_SIZE_IN_PIXELS
    @min_y = SQUARES_BETWEEN_ROOMS * SQUARE_SIZE_IN_PIXELS
    @max_y = @min_y + ROOM_SQUARE_SIZE * SQUARE_SIZE_IN_PIXELS
  end

  def draw( gc )
    gc.rectangle( @min_x, @min_y, @max_x, @max_y )

    # Squares
    1.upto( ROOM_SQUARE_SIZE ).each do |t|
      gc.line( @min_x + SQUARE_SIZE_IN_PIXELS*t, @min_y, @min_x + SQUARE_SIZE_IN_PIXELS*t, @max_y )
      gc.line( @min_x, @min_y + SQUARE_SIZE_IN_PIXELS*t, @max_x, @min_y + SQUARE_SIZE_IN_PIXELS*t )
    end

    if @entry_room
      print_text( gc, 'E' )
    end

  end

  def to_hash
    { room_id: @room_id, connected_hallways: @connected_hallways.map{ |k, h| { k => h.to_hash } } }
  end

  private

  def print_text( gc, text )
    x = @min_x + 3.3 * SQUARE_SIZE_IN_PIXELS
    y = @min_y + 4.7 * SQUARE_SIZE_IN_PIXELS
    gc.pointsize( 200 )
    gc.fill( 'black' )
    # puts text.join( '' ).inspect
    gc.text( x, y, text )
    gc.fill( 'white' )
  end

end