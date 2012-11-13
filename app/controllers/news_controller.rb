class NewsController < ApplicationController
  respond_to :json
  def update
    item = Refinery::News::Item.find params[:id]
    item.body = params[:body]
    item.save!
    render json: item
  end
end
