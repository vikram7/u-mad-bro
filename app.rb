require 'pry'
require 'sinatra'
require 'snooby'
require_relative 'u_mad_bro.rb'


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

get '/' do

  erb :index
end

post '/' do
  @username = params[:username]
  calculate(@username)
  binding.pry
  redirect '/'
end
