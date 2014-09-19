require 'Snooby'
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

def u_mad_bro(phrase)
  if num_negative_words(phrase) > num_positive_words(phrase)
    return "U MAD BRO"
  else
    return "u ain't even mad bro"
  end
end

def calculate(username)
  comment_array = []
  reddit = Snooby::Client.new
  count = 1

  reddit.u(username).comments(20).each do |comment|
    comment_array << {:body => comment.body, :karma_count => (comment.ups - comment.downs), :sentiment => u_mad_bro(comment.body)}
   count += 1
  end
  comment_array
end
