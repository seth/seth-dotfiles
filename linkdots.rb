#!/usr/bin/env ruby

require 'fileutils'

class DotFiler
  def initialize
    @dot_file_dir = File.expand_path(File.dirname(__FILE__))
    @backup_dir = ENV['HOME'] + "/dot-file-backups"
  end

  def backup(dot_file)
    if !File.exist?(@backup_dir)
      FileUtils.mkdir_p(@backup_dir)
    end
    FileUtils.cp_r(dot_file, @backup_dir)
  end

  def link_dots
    Dir.chdir(ENV['HOME']) do
      Dir.glob("#{@dot_file_dir}/dot-*").each do |f|
        nf = File.basename(f).sub(/^dot-/, ".")
        af = File.expand_path(f)
        if !File.symlink?(nf) && File.exist?(nf)
          backup(nf)
          puts "backing up #{nf} to #{@backup_dir}"
        end
        puts "linking #{nf} => #{af}"
        system("ln -nsf #{af} #{nf}")
      end
    end
  end
end

df = DotFiler.new
df.link_dots


