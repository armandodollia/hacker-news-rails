class VotesController < ApplicationController
  def create
    post = Post.find(params[:id])
    post.votes.create(value: 1)
  
    if request.xhr?
      content_type :json
      {id: post.id, points: post.points}.to_json
    else
      redirect_to '/posts'
    end
  end
end