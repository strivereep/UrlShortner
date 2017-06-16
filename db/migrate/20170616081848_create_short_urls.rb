class CreateShortUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :short_urls do |t|
      t.string :original_url
      t.string :string
      t.string :short_url
      t.string :string

      t.timestamps
    end
  end
end
