class OwnershipsController < ApplicationController
  before_action :logged_in_user

  def create
    if params[:item_code]
      @item = Item.find_or_initialize_by(item_code: params[:item_code])
    else
      @item = Item.find(params[:item_id])
    end

    # itemsテーブルに存在しない場合は楽天のデータを登録する。
    if @item.new_record?
      items = RakutenWebService::Ichiba::Item.search(itemCode: @item.item_code)

      item                  = items.first
      @item.title           = item['itemName']
      @item.small_image     = item['smallImageUrls'].first['imageUrl']
      @item.medium_image    = item['mediumImageUrls'].first['imageUrl']
      @item.large_image     = item['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '')
      @item.detail_page_url = item['itemUrl']
      @item.item_code       = item['itemCode']
      @item.save!
    end

    case params[:type]
    when Have.to_s then
      current_user.have(@item) unless current_user.have?(@item)
    when Want.to_s then
      current_user.want(@item) unless current_user.want?(@item)
    else
      raise 'type is invalid'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    case params[:type]
    when Have.to_s then
      current_user.unhave(@item) if current_user.have?(@item)
    when Want.to_s then
      current_user.unwant(@item) if current_user.want?(@item)
    else
      raise 'type is invalid'
    end
  end
end
