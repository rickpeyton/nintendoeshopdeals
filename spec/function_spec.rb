RSpec.describe "#handler" do
  it "exists" do
    result = handler(event: nil, context: nil)

    expect(result).to eq "got here"
  end
end