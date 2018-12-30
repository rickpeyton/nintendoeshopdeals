require "logger"

$logger = Logger.new(STDOUT)

def handler(event:, context:)
  $logger.info("EVENT: #{event.inspect}")
  
  { statusCode: 200, body: {} }
end