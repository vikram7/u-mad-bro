require 'csv'
require 'pry'

def load_positive_words
  positive_words = Array.new
  f = File.open('positive-words.txt')
  f.each_line do |line|
    positive_words << line.gsub("\n","")
  end
  positive_words
end

def load_negative_words
  negative_words = Array.new
  f = File.open('negative-words.txt')
  f.each_line do |line|
    negative_words << line.gsub("\n","")
  end
  negative_words
end

def num_positive_words(phrase)
  positive_words = load_positive_words
  pos_count = 0
  phrase_array = phrase.split
  phrase_array.each do |word|
    pos_count += 1 if positive_words.include? word
  end
  pos_count
end

def num_negative_words(phrase)
  negative_words = load_negative_words
  neg_count = 0
  phrase_array = phrase.split
  phrase_array.each do |word|
    neg_count += 1 if negative_words.include? word
  end
  neg_count
end

