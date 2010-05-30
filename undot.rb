#!/usr/bin/env ruby


ignore = [".", "..", ".git"]
Dir.glob(".*").select { |x| !ignore.member?(x) }.each do |f|
  nf = f.sub(/^\./, "")
  puts "mv #{f} dot-#{nf}"
end
