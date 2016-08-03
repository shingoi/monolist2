class RankingController < ApplicationController
    
    def have
        item_ids = Have.group(:item_id).order('count_all desc').count.keys.first(10)
        set_items(item_ids)
        @title = '持っているモノ TOP10'
    end
    
    def want
        item_ids = Want.group(:item_id).order('count_all desc').count.keys.first(10)
        set_items(item_ids)
        @title = '欲しいモノ TOP10'
    end
    
    private
    
    def set_items(item_ids)
        @items =[]
        item_ids.each do |item_id|
            @items.push(Item.find(item_id))
        end
    end
end
