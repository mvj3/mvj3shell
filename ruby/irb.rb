# encoding: UTF-8

require 'rubygems'
require 'fileutils'
require 'open-uri'

# enable encoding in UTF-8 if current ruby version is less than 1.9
unless defined? Encoding
  require 'jcode'
  $KCODE='utf8'
end

class Object
  # returns instance methods of current object's class and its singleton methods
  def lm # abbr of local methods
    self.methods.sort - self.class.superclass.instance_methods
  end
end

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
    require 'fileutils'
    require "addressable/uri"
    author, repo_name = Addressable::URI.parse(git_url ||= ARGV[0]).path.split('/').map {|i| i.sub("\.git", "") }
    author_dir = File.join(ENV['HOME'], 'github', author)
    FileUtils.mkdir_p author_dir
    FileUtils.chdir author_dir
    if File.directory? repo_name
      p("already installed #{git_url}")
    else
      `git clone #{git_url}`
    end
    FileUtils.chdir repo_name
  end

  def self.search keyword = nil
    FileUtils.chdir(ENV['HOME'] + '/github')
    Dir.glob('*/*').grep(Regexp.new(keyword ||= ARGV[0], 'i')).each {|repo| puts repo }
    nil
  end
end
