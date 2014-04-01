class SuperComputerPlayer < ComputerPlayer
  require './TicTacToeNode.rb'

  def move(game, current_player)
    board = game.board

    #Hardcode "if first turn, place in a random spot" as turn1 speedup
    return [rand(3), rand(3)] if board.rows.all? { |row| row.all? { |space| space.nil? } }

    state = TicTacToeNode.new(board, current_player)
    indeterminate_moves = []
    losing_moves = []

    state.children.each do |child|
      if child.winning_node?(current_player)
        return child.prev_move_pos
      elsif !child.losing_node?(current_player)
        #maybe go here - add to possible moves
        indeterminate_moves << child.prev_move_pos
      else
        losing_moves << child.prev_move_pos
      end
    end

    return losing_moves.sample if indeterminate_moves.empty?

    indeterminate_moves.sample

  end
end