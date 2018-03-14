require_relative '../lib/dungeon/dungeon'
# require_relative 'lib/walker'

s_seed = nil
s_seed = 236222324035710783327094102724920156016
seed = s_seed ? s_seed : Random.new_seed
puts "Dungeon seed = #{seed}"
srand( seed )

# d = Dungeon.new( 1, 0 )
d = Dungeon.new( 3 )
d.generate_dungeon

# d.print_dungeon
d.draw( '../out/dungeon.jpg' )

# d.draw_current_room( 'out/room.jpg'  )

# Walker.new( d ).main_loop

p d.available_directions

j = d.to_json
Dungeon.from_json(j )