require "logger"

$logger = Logger.new(STDOUT)

def handler(event:, context:)
  $logger.info("EVENT: #{event.inspect}")

  case event["path"]
  when "/update"
    limit = event["queryStringParameters"]["limit"].to_i
    offset = event["queryStringParameters"]["offset"].to_i
    NintendoEshop::Game.list(limit: limit, offset: offset)
  end

  { statusCode: 200, body: {} }
end