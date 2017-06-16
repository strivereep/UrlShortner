class ShortUrl < ApplicationRecord

  validates :original_url, presence: true, uniqueness: true

  after_create :generate_url_shortner

  def generate_url_shortner
    base_62_characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split('')
    array_of_character = get_url_shortner_ids
    corresponding_short_url = ""
    array_of_character.each do |index|
      corresponding_short_url << base_62_characters[index-1]
    end
    self.update_attribute(:short_url, corresponding_short_url)
  end

  def get_url_shortner_ids
    url_id = self.id
    array_of_id = []
    while url_id > 0
      remainder = url_id % 62
      array_of_id << remainder
      url_id = url_id / 62
    end
    array_of_id
  end

end
