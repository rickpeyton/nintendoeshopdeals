module NintendoEshop
  module Parser
    def self.games_list(list)
      current_time = Time.now.to_i
      list.dig("games", "game").map do |game|
        NintendoEshop::Game.new(
          nsid: game["nsuid"],
          title: game["title"],
          price: (game["eshop_price"].to_f * 100).to_i,
          image: game["front_box_art"],
          created_at: current_time
        )
      end
    end
  end
end