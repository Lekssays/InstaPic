#!/usr/bin/ruby
# Coded with <3 by Ahmed Lekssays

require 'open-uri'
require 'uri'

puts "Welcome To 1n5t4p1c :)"

puts "
  _____           _          ___ _      
  \_   \_ __  ___| |_ __ _  / _ (_) ___ 
   / /\/ '_ \/ __| __/ _` |/ /_)/ |/ __|
/\/ /_ | | | \__ \ || (_| / ___/| | (__ 
\____/ |_| |_|___/\__\__,_\/    |_|\___|

"
puts "Please enter an Instagram Username: "

Username = gets.chomp

url = "https://www.instagram.com/" + Username

source = open(url).read

code = source.split('\n')[0]

idxStart = "profile_pic_url_hd\"\:\""
idxEnd = "\"\,\"follows_viewer"

pic = code[/#{idxStart}(.*?)#{idxEnd}/m, 1]

picUrl = pic.gsub! '\/', '/'

picUrl = pic.gsub! 's320x320', 'p800x800'

encurl = URI.parse(URI.encode(picUrl))

system("firefox #{encurl}")

puts "#{Username}'s Profile Picture : #{picUrl}"
