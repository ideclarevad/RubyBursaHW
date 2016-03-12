class VotesController < ApplicationController

  def create
    #@vote = Vote.new(vote_params)
    @vote = Petition.find(params[:petition_id]).votes.build(vote_params)
    @votes = Vote.where(petition_id: params[:petition_id])
    if current_user.present?

    if @vote.save
      redirect_to root_url
    else
      render "new"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :petition_id)
  end

end
