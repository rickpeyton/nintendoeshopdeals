RSpec.describe "#handler" do
  it "exists" do
    
    result = handler(event: nil, context: nil)

    expect(result).to eq({ statusCode: 200, body: {} })
  end
end