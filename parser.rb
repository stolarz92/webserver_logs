# frozen_string_literal: true

require_relative "./app/parser_app"

file = ARGV[0]
raise ArgumentError if ARGV[0].nil? || ARGV[0].empty?

parser = ParserApp.new(file)

result = parser.call
