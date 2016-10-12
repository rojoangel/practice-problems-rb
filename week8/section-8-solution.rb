## Solution template for Guess The Word practice problem (section 7)

require_relative './section-8-provided'

class ExtendedGuessTheWordGame < GuessTheWordGame
  ## YOUR CODE HERE
end

class ExtendedSecretWord < SecretWord
  attr_accessor :word, :pattern

  def initialize word
    self.word = word
    self.pattern = initial_pattern word
  end

  def initial_pattern word
    (word.chars.map {|ch| if ch.match(/^[[:alpha:]]$/) then '-' else ch end}).join
  end

  def guess_letter! letter
    found = self.word.downcase.index letter.downcase
    if found
      start = 0
      while ix = self.word.downcase.index(letter.downcase, start)
        self.pattern[ix] = self.word[ix]
        start = ix + 1
      end
    end
    found
  end
end

## Change to `false` to run the original game
if true
  ExtendedGuessTheWordGame.new(ExtendedSecretWord).play
else
  GuessTheWordGame.new(SecretWord).play
end

