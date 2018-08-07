class EpicenterController < ApplicationController

before_action :authenticate_user!
before_action :set_user, only: [:show_user, :following, :followers]

  def feed
    @following_tweets = []

    Tweet.all.each do |tweet|
      if tweet.user.id == current_user.id || current_user.following.include?(tweet.user_id)
        @following_tweets.push tweet

        @tags = Tag.joins(:tweets)
      end
    end
  end

  def show_user
  end

  def all_users
    @users = User.all
  end

  def following
    @users = User.where(id: @user.following)
  end

  def followers
    @users = []

    User.all.each do |u|
      @users.push(u) if u.following.include?(@user.id)
    end
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end
end

private

def set_user
  @user = User.find(params[:id])
end
