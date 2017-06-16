class UrlsController < ApplicationController
  def index
  end

  def create
    @short_url = ShortUrl.new(url_params)
    if @short_url.save
      redirect_to url_path(@short_url)
    else
      redirect_to root_path  
    end
  end

  def show
    
  end

  def original_url
    corresponding_short_url = params[:short_url]
    url = ShortUrl.find_by(short_url: corresponding_short_url)
    redirect_to "https://#{url.original_url}"
  end

  private
    def url_params
      params.require(:short_url).permit(:original_url)
    end
end
