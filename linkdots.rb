#!/usr/bin/env ruby

Dir.glob("dot-*").each do |f|
  nf = f.sub(/^dot-/, ".")
  af = File.expand_path(f)
  puts "ln -nsf #{af} #{nf}"
end

[["zsh", ".zsh"],
 ["zsh/zshcomp", ".zshcomp"],
 ["zsh/zshrc", ".zshrc"]
].each do |fr, to|
  fr = File.expand_path(fr)
  puts "ln -nsf #{fr} #{to}"
end
