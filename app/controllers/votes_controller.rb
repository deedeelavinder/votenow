class VotesController < ApplicationController

  def new
    @vote = Vote.new

    render json: @vote
  end

  def show
    @vote = Vote.find(params[:id])

    render json: @vote
  end


  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end



  private
    
    def vote_params
      params[:vote]
    end
end
