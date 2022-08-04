require 'bundler/setup'

require 'httparty'

threads = 42.times.map do |i|
  Thread.new do
    response = HTTParty.get("https://rickandmortyapi.com/api/character?page=#{i+1}")
    puts response
  end
end

threads.each(&:join)
