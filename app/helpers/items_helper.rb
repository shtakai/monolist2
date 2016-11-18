module ItemsHelper
  def original_image_tag(item)
    image_tag(
      image_url(item).gsub(/\?_ex=128x128/,''), 
      alt: itemname(item)
    ) 
  end
  
  def item_name(item)
    "#{item_catch_copy(item)}#{itemname(item)}"
  end
  
  
  private 
  
  def image_url(item)
    # NOTE: nil check (try or &.)
    #  -配列とハッシュが混じったnilチェック ->imageFlagチェックで対応
    #  -商品画像有無は imageFlag 1:あり 0:なし
    if item.is_a? Item
      item.large_image
    elsif item['imageFlag'] == 1
      item.medium_image_urls[0]['imageUrl']
    else
    end
  end
  
  
  def item_catch_copy(item)
    "#{item['catchCopy'] }"
  end
  
  def itemname(item)
    item['itemName']
  end  
end