RSpec.describe NintendoEshop::Game do
  it "exists" do
    expect(described_class).to eq NintendoEshop::Game
  end

  describe ".list" do
    it "returns a collection of games" do
      stub_fetch_games_list

      result = described_class.list(limit: 40, offset: 0)

      expect(result.first.nsid).to eq "70010000012332"
      expect(result.first.title).to eq "Super Smash Bros. Ultimate"
      expect(result.first.price).to eq 5999
      expect(result.first.image).to eq "https://media.nintendo.com/nintendo/bin/NhJKOajUMaYvsmA3U_t7yopYGn9Ngg68/AX0pHGUTlEwA-EOlpxZF15lslYF-WRp6.png"
      expect(result.first.created_at).to be_an Integer
    end
  end
end
