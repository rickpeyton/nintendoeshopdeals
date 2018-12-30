require "logger"
require_relative "lib/nintendo_eshop"

LOGGER = Logger.new(STDOUT)

def handler(event:, context:)
  LOGGER.info("EVENT: #{event.inspect}")
  LOGGER.info("EVENT: #{context.inspect}")

  case event["path"]
  when "/update"
    limit = event["queryStringParameters"]["limit"].to_i
    offset = event["queryStringParameters"]["offset"].to_i
    NintendoEshop::Game.list(limit: limit, offset: offset)
  end

  { statusCode: 200, body: {} }
end
