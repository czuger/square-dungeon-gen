require 'set'

class DungeonWalker

  WALKING_POSITIONS = [ [ -1, 0 ], [ 1, 0 ], [ 0, -1 ], [ 0, 1 ] ]

  def initialize( rooms, dungeon_size, entry_room )
    @rooms = rooms
    @dungeon_size = dungeon_size
    @entry_room = entry_room
  end

  def walk_rooms()
    walking_room_queue = [ @entry_room.top_left_array ]
    walked_rooms_positions = Set.new

    until walking_room_queue.empty?
      current_room_position = walking_room_queue.shift
      walked_rooms_positions << current_room_position

      connected_rooms_positions = get_connected_rooms_positions(  current_room_position )
      connected_rooms_positions.each do |room_position|
        # p room_position
        next if walked_rooms_positions.include?( room_position )
        walked_rooms_positions << room_position
        walking_room_queue << room_position
        # p walked_rooms_positions
      end

    end
    walked_rooms_positions
  end

  def get_connected_rooms_positions( room_position )
    connected_positions = []
    WALKING_POSITIONS.each do |wp|

      top = room_position[0] + wp[0]
      left = room_position[1] + wp[1]

      if( room_position != [ top, left ] && top >= 1 && left >= 1 && top <= @dungeon_size && left <= @dungeon_size &&
          @rooms.has_key?( [ top, left ] ) )
        connected_positions << [ top, left ]
      end

    end
    # p connected_positions
    connected_positions
  end

end