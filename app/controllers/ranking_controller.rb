class RankingController < ApplicationController
  # NOTE: showing ranking only when logged in
  before_action :logged_in_user, only: [:have, :want] 

  
  # TODO: use kaminari 
  def have
    @ranking_title = 'Ranking Items members have'
    @rankings = Have.rankings 
    render 'ranking'
  end
  
  def want
    @ranking_title = 'Ranking Items members want'
    @rankings = Want.rankings 
    render 'ranking'
  end
    
end
