# 1, 2, 3, 4, 5, 6, 7, 8
# 9,10,11,12,13,14,15,16
#17,18,19,20,21,22,23,24
#25,26,27,28,29,30,31,32
#33,34,35,36,37,38,39,40
#41,42,43,44,45,46,47,48
#49,50,51,52,53,54,55,56
#57,58,59,60,61,62,63,64

def num_moves(start_pos, end_pos)
  return 1 if valid_move?(start_pos, end_pos)
  
  moves_from_end = valid_moves(end_pos)
  return 2 if valid_moves(start_pos).any? { |pos| moves_from_end.include?(pos) }
  return nil
end

def valid_move?(start_pos, end_pos)
 diff = end_pos - start_pos
 diff % 7 == 0 || diff % 9 == 0
end

def valid_moves(start_pos)
  moves = []
  [9, -9, 7, -7].each do |diff|
    pos = start_pos + diff
    prev_row, row = row(start_pos), row(pos)
    while (prev_row - row).abs == 1
      moves << pos
      pos += diff
      prev_row, row = row, row(pos)
    end
  end
  moves
end

def row(pos)
  (pos / 8.0).ceil
end
