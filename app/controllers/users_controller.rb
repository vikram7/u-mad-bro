class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)

    name_and_comments = Comment.calculate(@user.username)
    name_and_comments.each do |comment_hash|
      a = Comment.create(user_id: id, comment: comment_hash[:body], karma: comment_hash[:karma_count], mad: comment_hash[:sentiment])
      a.save
    end

    @comments = @user.comments

  end

end
