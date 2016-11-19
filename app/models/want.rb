class Want < Ownership
  # TODO: offset / page (kaminari)
  def self.rankings
    group(:item_id).
        order('count_all desc').
        limit(RANKING_LIMIT).
        count.
        map.with_index(1) { |elem, index| {index: index, item: Item.find(elem[0]), count: elem[1]} }
        # map{ |id, count| {item: Item.find(id), count: count} }
        # NOTE: ↑のmapは最適化できるのか？
  end
end
