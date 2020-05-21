class Picture

  attr_reader :id, :url, :listing_id

  def initialize(id:, url:, listing_id:)
    @id = id
    @url = url
    @listing_id = listing_id
  end

  def self.create(url:, listing_id:)
    result = DatabaseConnection.query("INSERT INTO pictures (url, listing_id) VALUES('#{url}', '#{listing_id}') RETURNING id, url, listing_id;")
    Picture.new(id: result[0]['id'], url: result[0]['url'], listing_id: result[0]['listing_id'])
  end
end