RSpec.describe NintendoEshop::Parser do
  it "exists" do
    expect(described_class).to eq NintendoEshop::Parser
  end

  describe ".games_list" do
    it "returns a collection of games" do
      list = YAML.safe_load(File.read("spec/support/parsed_games_list.txt"))

      result = described_class.games_list(list)

      expect(result.first).to be_a NintendoEshop::Game
      expect(result.size).to eq 40
    end
  end
end
