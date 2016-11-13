module ItemsHelper
  def original_image_tag(item)
    image_tag(
      image_url(item).gsub(/\?_ex=128x128/,''), 
      alt: image_alt(item)
    ) 
  end
  
  def item_name(item)
    "#{item_catch_copy(item)}#{itemname(item)}"
  end
  
  
  private 
  
  def image_url(item)
    # NOTE: nil check (try or &.)
    #  配列とハッシュが混じったnilチェックを行いたい
    item.medium_image_urls[0]['imageUrl'] || 'no-image.png'
  end
  
  def image_alt(item)
    item['itemName'] || 'no description'
  end
  
  def item_catch_copy(item)
    "#{item['catchCopy'] }" || ''
  end
  
  def itemname(item)
    item['itemName'] || 'no name'
  end  
end