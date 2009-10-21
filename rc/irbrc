#!/usr/bin/env ruby

# load rubygems and wirble
require 'rubygems' rescue nil
require 'wirble'
require 'pp'
require 'colored'

# improve irb’s default output
require 'hirb'
Hirb::View.enable

# Tab completion, cross-session history, history file
require 'irb/completion'
IRB.conf[:USE_READLINE] = true
Readline.vi_editing_mode
module Readline
  module History
    LOG = "#{ENV['HOME']}/.irb_history"

    def self.write_log(line)
      File.open(LOG, 'ab') {|f| f << "#{line}\n"}
    end

    def self.start_session_log
      write_log("\n# session start: #{Time.now}\n\n")
      at_exit { write_log("\n# session stop: #{Time.now}\n") }
    end
  end

  alias :old_readline :readline
  def readline(*args)
    ln = old_readline(*args)
    begin
      History.write_log(ln)
    rescue
    end
    ln
  end
end
Readline::History.start_session_log
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Enable prompt-less prompts
IRB.conf[:PROMPT][:XMP][:RETURN] = "\# => %s\n"
IRB.conf[:PROMPT][:XMP][:PROMPT_I] = ">> "
IRB.conf[:PROMPT_MODE] = :XMP
IRB.conf[:AUTO_INDENT] = true

# load wirble
Wirble.init
Wirble.colorize
# UTF-8 CODE
require 'jcode'
$KCODE='utf8'

class Object
  def non_class_methods
    self.methods - Class.methods
  end

  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

# file utility
# *stolen* from http://gist.github.com/90444
def ls
  %x{ls}.split("\n")
end

def cd(dir)
  dir.nil? ? Dir.chdir(ENV['HOME']) : Dir.chdir(dir)
  Dir.pwd
end

#def cd(*dir)
  #Dir.chdir(ENV['HOME']) if *dir.length != 0
  #Dir.chdir(dir) if *dir.length == 1
#end

def pwd
  Dir.pwd
end

def method_missing(dir)
  ls.include?(dir.to_s) ? dir.to_s : super
end

# Copious output helper
def less
  spool_output('less')
end

def most
  spool_output('most')
end

def spool_output(spool_cmd)
  require 'stringio'
  $stdout, sout = StringIO.new, $stdout
  yield
  $stdout, str_io = sout, $stdout
    IO.popen(spool_cmd, 'w') do |f|
      f.write str_io.string
      f.flush
      f.close_write
    end
end

# Simple regular expression helper
# show_regexp - stolen from the pickaxe
def show_regexp(a, re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

# Convenience method on Regexp so you can do
# /an/.show_match("banana")
class Regexp
  def show_match(a)
    show_regexp(a, self)
  end
end

# Vim helper
def vi *args
  flattened_args = args.map { |arg| "\"#{arg.to_s}\""}.join ' '
  `vim #{flattened_args}`
end

def clear
  system 'clear'
end

def dumphist(num, path)
  File.open(path, 'w') do |file|
    Readline::HISTORY.to_a[-num-1..Readline::HISTORY.length-3].each do |line|
      file.puts  line
    end
  end
end

## Aliases
alias q exit
alias p pp

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# add ~/.ruby to the library search path
$LOAD_PATH << File.expand_path('~/.ruby')
