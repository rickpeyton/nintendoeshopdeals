module NintendoEshop
  module Parser
    def self.games_list(list) # rubocop:disable Metrics/MethodLength
      current_time = Time.now.to_i
      list.dig("games", "game").map do |game|
        sale_price = game["sale_price"]
        price = sale_price.nil? ? game["eshop_price"] : sale_price
        NintendoEshop::Game.new(
          id: game["nsuid"],
          title: game["title"],
          price: (price.to_f * 100).to_i,
          image: game["front_box_art"],
          created_at: current_time
        )
      end
    end
  end
end
