class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)

    @vote.save

    session[:voted_polls] ||= []
    session[:voted_polls] << @vote.choice.poll.id

    redirect_to permalink_path(@vote.choice.poll.permalink)
  end


  private
    def vote_params
      params.permit(:choice_id)
    end
end

