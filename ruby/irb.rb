#!/usr/bin/env ruby

unless defined? RUBY_ENGINE
  # load rubygems and pp
  %w$rubygems pp irb fileutils uri$.each {|std| require std}

  # Aliases
  alias x exit
  alias p pp
end

# enable encoding in UTF-8 if current ruby version is less than 1.9
unless defined? Encoding
  require 'jcode'
  $KCODE='utf8'
end

# require wirble and hirb
%w$interactive_editor wirble hirb ruby-debug$.each {|gem|
  begin
    require gem
  rescue LoadError
    warn "You haven't installed \"#{gem}\" in your current GEM_PATH!"
  end
}

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
  extend self
  def play
    mixes = Dir.glob(ENV['HOME'] + '/Music/*/*').delete_if {|s| s !~ /(ape|mp3|flac|wav)$/ }; count = 0; loop do; print "##{count += 1} ", Time.now.strftime('%I:%M:%S'), " #{single = mixes[rand mixes.size]; p = Pathname.new(single); p.dirname.basename.to_s << '/' << p.basename}\n"; `mplayer #{single}` end
  end
end

module CheckSyntax
  extend self
  def ruby rc
    `#{rc} status`.scan(/\s([^\s]*?\.rb)\s/).flatten.each {|f| `ruby -c #{f}` }
  end
end

module Github
  def self.install git_url
    cd FileUtils.mkdir_p(ENV['HOME'] + '/github')
    cd FileUtils.mkdir_p((author_and_source_array = URI.parse(git_url).path.split('/'))[1])
    File.directory?(source_dir = author_and_source_array[-1].split('.')[0]) ? p("already installed #{git_url}") : `git clone #{git_url}`
    cd source_dir
  end
end
