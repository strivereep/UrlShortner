require 'test_helper'

class ShortUrlTest < ActiveSupport::TestCase

  test "should be valid" do
    @short_url = ShortUrl.new(original_url: "www.google.com", short_url: "")
    assert @short_url.valid?
  end

  test "original url should be present" do
    @short_url = ShortUrl.new(original_url: "", short_url: "")
    assert_not @short_url.valid?
  end

  test "original url should be unique" do
    @short_url1 = ShortUrl.create(original_url: "www.google.com", short_url: "")
    @short_url2 = @short_url1.dup
    assert_not @short_url2.valid?
  end

  test "get url shortner characters for original url" do
    @short_url = ShortUrl.new(original_url: "www.facebook.com", short_url: "")
    @short_url.save
    assert_equal(String, @short_url.short_url.class)
  end

end
