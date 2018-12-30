require "nintendo_eshop/http_client"

require "nintendo_eshop/game"
require "nintendo_eshop/parser"

begin
  require "pry"
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

module NintendoEshop; end
