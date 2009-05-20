class WordForgery < Forgery
  def self.word
    dictionaries[:words].random
  end
end
