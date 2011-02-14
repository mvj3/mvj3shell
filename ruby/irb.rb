#!/usr/bin/env ruby

# load rubygems and pp
%w$rubygems pp irb fileutils uri$.each {|std| require std}

# Aliases
alias x exit
alias p pp

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
  require 'pathname'
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
  def self.ruby rc
    `#{rc} status`.scan(/\s([^\s]*?\.rb)\s/).flatten.each {|f| `ruby -c #{f}` }
  end
end

module GitHub
  def self.clone git_url = nil
    cd FileUtils.mkdir_p(ENV['HOME'] + '/github')
    cd FileUtils.mkdir_p((author_and_source_array = URI.parse(git_url ||= ARGV[0]).path.split('/'))[1])
    File.directory?(source_dir = author_and_source_array[-1].split('.')[0..-2].join('.')) ? p("already installed #{git_url}") : `git clone #{git_url}`
    cd source_dir
  end

  def self.search keyword = nil
    cd(ENV['HOME'] + '/github')
    Dir.glob('*/*').grep(Regexp.new(keyword ||= ARGV[0], 'i')).each {|repo| puts repo }
    nil
  end
end
