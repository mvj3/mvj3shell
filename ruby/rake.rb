%w(fileutils dm-core).each {|l| require l }
include FileUtils

def now(path); path + '.' << Time.now.strftime("%m%d%H%M%Y") end
def home(path); ENV['HOME'] + '/' << path end
def utils(path); ENV['HOME'] + '/utils/' << path << '/' end
def sub_files_and_dirs(dir); Dir.entries(dir)[2..-1].map {|s| s.match(/.[a-z]*/).to_s } end

def setup(path, is_cp = false)
  # implement #to and #from under your namespace
  t, f = to(path), from(path)
  mv t, now(t) if File.exists?(t) || File.symlink?(t)
  is_cp ? cp(f, t) : ln_s(f, t)
end

namespace :ff do
  FIREFOX_CONFIG_PATH = Dir.glob(ENV['HOME'] + (RUBY_PLATFORM =~ /darwin/ ? "/Library/Application\ Support/Firefox/Profiles/*.default" : "/.mozilla/firefox/*.default"))[0]

  def to(path); FIREFOX_CONFIG_PATH << '/' << path end
  def from(path); utils('firefox') << path end

  dirs = sub_files_and_dirs('firefox')
  desc "install all firefox's config files"
  task :all do; dirs.each {|p| setup p } end

  dirs.each do |path|
    eval("desc 'install #{path}'; task :#{path} do; setup '#{path}' end")
  end
end

namespace :rc do
  def to(path); home path end
  def from(path); utils('rc') << path end
  def dot(path); '.' << path end

  rc_files = sub_files_and_dirs('rc').map {|s| s[1..-1] }.delete_if {|s| s.match(/vim|git/) }
  rc_files.each do |rc|
    eval("desc 'setup #{rc} pref'; task :#{rc} do; setup '#{dot(rc)}' end")
  end

  desc "setup vim"
  task :vim do
    ['.vimrc', '.gvimrc', 'vim'].each {|rc| setup rc }
  end

  desc "setup git"
  task :git do; setup dot('gitconfig'), true; setup dot('gitexcludes') end

  desc "setup all rc files"
  task :all => [:vim, :git] do; rc_files.each {|rc| setup dot(rc) } end
end
