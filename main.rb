# See: https://bundler.io/guides/bundler_setup.html
require 'rubygems'
require 'bundler/setup'
require 'httparty'

threads = 42.times.map do |i|
  # See: https://ruby-doc.org/core-2.7.3/Thread.html
  Thread.new do
    response = HTTParty.get("https://rickandmortyapi.com/api/character?page=#{i+1}")
    puts response
  end
end

# See: https://ruby-doc.org/core-2.7.3/Thread.html#join-method
threads.each(&:join)
