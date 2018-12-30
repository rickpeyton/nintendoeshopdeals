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

      result = TestHttpClient.new.fetch(:get, "https://www.nintendo.com/json/content/get/filter/game?limit=40&offset=0&system=switch&availability=now&sort=featured&direction=des&shop=ncom")

      expect(result.dig("games", "game").first.dig("nsuid")).to eq "70010000012332"
    end
  end
end

def stub_fetch_games_list
  stub_request(:get, "https://www.nintendo.com/json/content/get/filter/game?availability=now&direction=des&limit=40&offset=0&shop=ncom&sort=featured&system=switch").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host'=>'www.nintendo.com',
          'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: fetch_games_list_response, headers: {})
end

def fetch_games_list_response
  File.read("spec/support/fetch_games_list_response.txt")
end