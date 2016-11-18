class Ownership < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  
  LIMIT = 50
  
  # TODO: offset / page (kaminari)
  def self.ranking_owned(own_type: nil)
    where(type: own_type).
        group(:item_id).
        order('count_all desc').
        limit(LIMIT).
        count.
        map{ |id, count| {id: id, count: count} }
  end
  
end
