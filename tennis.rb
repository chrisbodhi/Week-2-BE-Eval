module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Instance representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      winner.points += 1
    end

    # Randomly picks 1 or 2 to determine the winner of a serve
    def who_won?
      which = rand(2) + 1
      if which == 1
        return @player1
      else
        return @player2
      end
    end

    # The situation for a deuce, returns a String noting the score as deuce
    def deuce
      @player1.points >= 3
      @player2.points = @player1.points

      return 'The score is deuce.'
    end

    # Returns an exclamation for the winning player.
    def win 
      return 'Win!'
    end

    # Easiest situation for winning a game.
    def easy_win(player)
      win if player.points == 4 && player.opponent.points < 3
    end

    # Notes advantage for player who scores once after deuce.
    def advantage(player)
      if deuce
        player.points +=1
        return 'Advantage!'
      end
    end

  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
    end

  end
end