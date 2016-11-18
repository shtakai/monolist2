class Ownership < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  
  RANKING_LIMIT = 49
  
  # TODO: offset / page (kaminari)
  def self.ranking_owned(own_type: nil)
    where(type: own_type).
        group(:item_id).
        order('count_all desc').
        limit(RANKING_LIMIT).
        count.
        map{ |id, count| {item: Item.find(id), count: count} }
        # map{ |id, count| {item: Item.find(id), count: count} }
        # NOTE: ↑のmapは最適化できるのか？
  end
  
end
