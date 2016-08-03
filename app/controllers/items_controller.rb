class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
    @have_users = @item.have_users
    @want_users = @item.want_users
    @title = "#{@item.title} - monolist"
    @description = "#{@item.title}に関する情報です。この商品を欲しい人、持ってる人を表示しています。"
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
