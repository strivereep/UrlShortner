module UrlsHelper

  def get_short_url
    ShortUrl.last
  end

end
