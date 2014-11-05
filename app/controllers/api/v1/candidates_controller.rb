class Api::V1::CandidatesController < ApplicationController


  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate, status: :created, location: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end


  private

  def candidate_params
    params.require(:candidate).permit(:name, :email, :party_affil, :district, :seat)
  end

end
