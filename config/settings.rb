# frozen_string_literal: true

module Bookshelf
  class Settings < Hanami::Settings
    setting :database_url, constructor: Types::String
  end
end
