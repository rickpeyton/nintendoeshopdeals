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
      expect(result.first.image).to eq "https://media.nintendo.com/nintendo/bin/vt7les7qOfqmuiYlgQqE1KvoBGcDYwfW/IEqiKeiJ-27z1heGl5Wc34Nmhp_T_3aW.png"
      expect(result.first.created_at).to eq 1546137173
    end
  end
end
