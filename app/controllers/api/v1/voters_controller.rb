class Api::V1::VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :restrict_access_to_voter, only: [:update]

  def new
    @voter = Voter.new
  end

  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  def create
    @voter = Voter.new(voter_params)
    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  def edit

  end

  def update
    if @voter.update(voter_params)
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  private

  def restrict_access_to_voter
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def voter_params
    params.require(:voter).permit(:name, :email, :location, :party_affil)
  end
end

