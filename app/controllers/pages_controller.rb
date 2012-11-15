class PagesController < ApplicationController
  respond_to :json
  def update
    @page = Refinery::Page.find params[:id]
    #Find the edited part and update it
    @page.parts.each do |page_part|
      body = params[:page][page_part.title.to_s.downcase.gsub(" ", "_").to_sym]
      if body
        page_part.body = body
        page_part.save!
      end
    end
    render json: @page
  end
end
