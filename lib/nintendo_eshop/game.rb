module NintendoEshop
  class Game
    extend HttpClient
    
    def self.list(limit: 40, offset: 0)
      url = "https://www.nintendo.com/json/content/get/filter/game?limit=#{limit}&offset=#{offset}&system=switch&availability=now&sort=featured&direction=des&shop=ncom"
      response = fetch(:get, url)
      # parse_list_response(response)
      [new]
    end

    def nsid
      "70010000012332"
    end

    def title
      "Super Smash Bros. Ultimate"
    end

    def price
      5999
    end

    def image
      "https://media.nintendo.com/nintendo/bin/vt7les7qOfqmuiYlgQqE1KvoBGcDYwfW/IEqiKeiJ-27z1heGl5Wc34Nmhp_T_3aW.png"
    end

    def created_at
      1546137173
    end
  end
end
