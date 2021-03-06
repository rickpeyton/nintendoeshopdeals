module NintendoEshop
  class Game
    extend HttpClient

    def self.list(limit: 40, offset: 0)
      url = <<~NINTENDO_URL
        https://www.nintendo.com/json/content/get/filter/game?limit=#{limit}
        &offset=#{offset}&system=switch&availability=now&sort=featured
        &direction=des&shop=ncom
      NINTENDO_URL
      response = fetch(:get, url)
      NintendoEshop::Parser.games_list(response)
    end

    attr_reader :id, :title, :price, :image, :created_at

    def initialize(
      id:,
      title:,
      price:,
      image:,
      created_at:
    )
      @id = id
      @title = title
      @price = price
      @image = image
      @created_at = created_at
    end
  end
end
