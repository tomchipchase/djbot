#!/usr/bin/ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "actions"

results = Actions::SpotifySearcher.(ARGV[0])

results.each { |result| puts "#{result.name} by #{result.artists.map(&:name).join(" ")}" }
