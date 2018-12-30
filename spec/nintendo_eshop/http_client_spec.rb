RSpec.describe NintendoEshop::HttpClient do
  it "exists" do
    expect(described_class).to eq NintendoEshop::HttpClient
  end

  describe "#fetch" do
    class TestHttpClient
      include NintendoEshop::HttpClient
    end

    it "returns a json response" do
      stub_fetch_games_list

      result = TestHttpClient.new.fetch(:get, "https://www.nintendo.com/json/content/get/filter/game?limit=40&offset=0&system=switch&availability=now&sort=featured&direction=des&shop=ncom") # rubocop:disable Metrics/LineLength

      expect(result.dig("games", "game").first.dig("nsuid")).to eq "70010000012332"
    end
  end
end
