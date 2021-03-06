require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do 
      game.player1.opponent = game.player2
      game.player2.opponent = game.player1

      expect(game.player1.opponent).to eq game.player2
      expect(game.player2.opponent).to eq game.player1
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)
      game.player1.points += 1

      expect(game.player1.points).to eq(2)
    end
  end

  describe '#win' do
    it 'returns a win exclamation when called' do
      expect(game.win).to eq 'Win!'
    end
  end

  describe '#easy_win' do
    it 'calls the #win function if the player wins by at least two points' do
      game.player1.points = 4
      game.player2.points < 3

      expect(game.easy_win(game.player1)).to eq 'Win!'
    end
  end

  describe '#deuce' do
    it 'notes the condition of deuce' do 
      game.player1.points = 3
      game.player2.points = game.player1.points

      expect(game.deuce).to eq 'The score is deuce.'
    end
  end

  describe '#advantage' do
    it 'notes an advantage to player who has won the ball after deuce' do
      game.deuce
      game.player1.points += 1

      expect(game.advantage(game.player1)).to eq 'Advantage!'
    end
  end

  describe '#who_won?' do
    it 'picks a random number (1 or 2) to decide which player won the ball' do
      expect(game.who_won?).to eq game.player1
    end
  end

  describe '#play_sports'do
    context 'when' do 
      it '' do
        
      end
    end

    context 'when' do 
      it '' do

      end
    end

    context 'when' do 
      it '' do

      end
    end

  end

end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do 
        player.points = 2

        expect(player.score).to eq('thirty')
      end  
    end
    
    context 'when points is 3' do
      it 'returns forty' do 
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end
  end



  
end