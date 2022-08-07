require_relative "./app/parser"

file = ARGV[0]
raise ArgumentError if ARGV[0].nil? || ARGV[0].empty?

parser = Parser.new(file)

result = parser.call
puts result
