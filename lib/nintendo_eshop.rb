require_relative "nintendo_eshop/game"
require_relative "nintendo_eshop/http_client"

begin
  require "pry"
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

module NintendoEshop; end
