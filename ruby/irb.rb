#!/usr/bin/env ruby

module Rubygem; end
def Rubygem.multiple_require gems = []
  require 'rubygems'
  Kernel.class_eval { gems.map &method(:require) }
end

Rubygem.multiple_require %w[rubygems pp irb fileutils uri pathname]

# Aliases
alias x exit
alias p pp

# enable encoding in UTF-8 if current ruby version is less than 1.9
unless defined? Encoding
  require 'jcode'
  $KCODE='utf8'
end

# load debug utility
require ENV['HOME'] + '/utils/ruby/debug.rb'

# load wirble
if defined? Wirble
  Wirble.init
  Wirble.colorize
end

# improve irb’s default output
Hirb::View.enable if defined? Hirb

module Music
  def self.play
    dirs = Dir.glob(ENV['HOME'] + '/Music/*')
    dirs.delete_if {|s| s !~ Regexp.new(ARGV[0], 'i') } unless ARGV.size.zero?
    count = 0
    loop do
      count += 1
      dir = dirs[rand dirs.size]
      puts "##{count} #{Time.now.strftime('%I:%M:%S')} #{dir.split('/')[-1]}"
      FileUtils.chdir dir
      `mplayer *ape`
    end unless dirs.size.zero?
  end
end

module CheckSyntax
  def self.ruby command
    `command`.scan(/\s([^\s]*?\.rb)\s/).flatten.each {|f| `ruby -c #{f}` }
  end
end

module GitHub
  def self.clone git_url = nil
    dir = ENV['HOME'] + '/github'
    FileUtils.mkdir_p(dir)
    cd dir
    author_and_source_array = URI.parse(git_url ||= ARGV[0]).path.split('/')
    [dir, author_and_source_array[1]].each {|d| FileUtils.mkdir_p(d); cd d }
    project_name = author_and_source_array[-1].split('.')[0..-2].join('.')
    if File.directory? project_name
      p("already installed #{git_url}")
    else
      `git clone #{git_url}`
    end
    cd project_name
  end

  def self.search keyword = nil
    cd(ENV['HOME'] + '/github')
    Dir.glob('*/*').grep(Regexp.new(keyword ||= ARGV[0], 'i')).each {|repo| puts repo }
    nil
  end
end



module Mvj3
  module Sql
    extend self
    def delete_all_records_and_set_auto_increment_to_one *models
      models.map(&:table_name).each do |tn|
        ActiveRecord::Base.connection.execute("DELETE FROM #{tn}")
        ActiveRecord::Base.connection.execute("ALTER TABLE #{tn} AUTO_INCREMENT = 1")
      end
    end
  end
end
