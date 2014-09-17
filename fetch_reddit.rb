require 'pry'
require 'snooby'
require_relative 'u_mad_bro.rb'

puts "enter a reddit username"
username = gets.chomp.to_s
puts

reddit = Snooby::Client.new
count = 1

reddit.u(username).comments(20).each do |comment|
  puts count.to_s + ": " + comment.body
  puts "karma count: " + (comment.ups - comment.downs).to_s
  puts "sentiment: " + u_mad_bro(comment.body)
  puts
  count += 1
end
