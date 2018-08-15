class VotesController < ApplicationController
 before_action :authenticate_user!

  def create
  tweet = Tweet.find(params[:id])	
  tweet.liked_by current_user
  redirect_to tweets_path, notice: "jij vind deze tweet leuk"
  end

  def destroy
  tweet = Tweet.find(params[:id])  
  tweet.unliked_by current_user
  redirect_to tweets_path, notice: "jij vind deze tweet niet meer leuk"
  end
end
