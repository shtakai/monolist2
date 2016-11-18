class RankingController < ApplicationController
  
  # TODO: use kaminari 
  def have
    @ranking_title = 'Ranking Items members have'
    @rankings = Ownership.ranking_owned(own_type: Have.to_s)
    render 'ranking'
  end
  
  def want
    @ranking_title = 'Ranking Items members want'
    @rankings = Ownership.ranking_owned(own_type: Want.to_s)
    render 'ranking'
  end
    
end
