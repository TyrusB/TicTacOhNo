require './TicTacToe.rb'

class TicTacToeNode
  attr_reader :board, :current_player, :next_player, :children, :prev_move_pos
  def initialize(board, current_player, prev_move_pos = nil)
    @board = board
    @current_player = current_player
    @next_player = self.other_player(current_player)
    @children = self.children
    @prev_move_pos = prev_move_pos
  end

  def children
    children = []
    (0..2).each do |x|
      (0..2).each do |y|
        new_board = @board.dup
        pos = [x, y]

        if new_board[pos].nil? && !new_board.over?
          new_board[pos] = @current_player
          children << TicTacToeNode.new(new_board, @next_player, pos)
        end
      end
    end
    children
  end

  def losing_node?(player_to_check)
    winning_node?(self.other_player(player_to_check))
  end

  def other_player(player)
    possible_players = [:x, :o]
    possible_players.delete(player)
    possible_players[0]
  end

  def winning_node?(player_to_check)
    if board.winner == player_to_check
      return true
    elsif @children.empty?
      return false
    else
      if player_to_check == @current_player
        #player's turn, one child node wins
        @children.any? { |child| child.winning_node?(player_to_check) }
      elsif player_to_check == @next_player
        #opponent's turn, all child nodes win
        @children.all? { |child| child.winning_node?(player_to_check) }
      else
        #tie or lose
        return false
      end
    end
  end
end