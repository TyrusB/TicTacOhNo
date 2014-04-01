load "./TicTacToe.rb"

hal9000 = SuperComputerPlayer.new("HAL 9000")
deepblue = SuperComputerPlayer.new("Deep Blue")
commodore64 = ComputerPlayer.new("Commodore 64")
ibm286 = ComputerPlayer.new("IBM 286")
jim = HumanPlayer.new("Jim")
bob = HumanPlayer.new("Bob")

if __FILE__ == $PROGRAM_NAME
  while true
    wargames = TicTacToe.new(hal9000, deepblue)
    wargames.run
  end
end