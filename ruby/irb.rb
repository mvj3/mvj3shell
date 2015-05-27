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

module GitHub
  def self.clone git_url = nil
    require 'fileutils'
    require "addressable/uri"
    author, repo_name = Addressable::URI.parse(git_url ||= ARGV[0]).path.split('/').map {|i| i.sub("\.git", "") }[-2..-1]
    author_dir = File.join(ENV['HOME'], 'github', author)
    FileUtils.mkdir_p author_dir
    FileUtils.chdir author_dir
    #require 'pry'; binding.pry
    #puts author_dir, repo_name
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
