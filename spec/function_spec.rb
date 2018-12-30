RSpec.describe "#handler" do
  it "exists" do
    result = handler(event: { path: "" }, context: nil)

    expect(result).to eq(statusCode: 200, body: {})
  end

  it "routes update requests" do
    allow(NintendoEshop::Game).to receive(:list).with(limit: 200, offset: 200)
    event = sample_event

    handler(event: event, context: nil)

    expect(NintendoEshop::Game).to have_received(:list).with(limit: 200, offset: 200)
  end
end

def sample_event
  { "httpMethod" => "GET", "body" => nil, "resource" => "/update", "requestContext" => { "resourceId" => "123456", "apiId" => "1234567890", "resourcePath" => "/update", "httpMethod" => "GET", "requestId" => "c6af9ac6-7b61-11e6-9a41-93e8deadbeef", "accountId" => "123456789012", "stage" => "prod", "identity" => { "apiKey" => nil, "userArn" => nil, "cognitoAuthenticationType" => nil, "caller" => nil, "userAgent" => "Custom User Agent String", "user" => nil, "cognitoIdentityPoolId" => nil, "cognitoAuthenticationProvider" => nil, "sourceIp" => "127.0.0.1", "accountId" => nil }, "extendedRequestId" => nil, "path" => "/update" }, "queryStringParameters" => { "limit" => "200", "offset" => "200" }, "headers" => { "Host" => "localhost:3000", "Connection" => "keep-alive", "Upgrade-Insecure-Requests" => "1", "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36", "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8", "Accept-Encoding" => "gzip, deflate, br", "Accept-Language" => "en-US,en;q=0.9", "X-Forwarded-Proto" => "http", "X-Forwarded-Port" => "3000" }, "pathParameters" => nil, "stageVariables" => nil, "path" => "/update", "isBase64Encoded" => false } # rubocop:disable Metrics/LineLength
end
