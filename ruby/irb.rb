#!/usr/bin/env ruby

unless defined? RUBY_ENGINE
  # load rubygems and pp
  %w$rubygems pp$.each {|std| require std}

  # Aliases
  alias q exit
  alias p pp
end

# enable encoding in UTF-8 if current ruby version is above 1.9
unless defined? Encoding
  require 'jcode'
  $KCODE='utf8'
end

# require wirble and hirb
%w$wirble hirb$.each {|gem|
  begin
    require gem
  rescue LoadError
    warn "You haven't installed \"#{gem}\" in your current GEM_PATH!"
  end
}

# load wirble
if defined? Wirble
  Wirble.init
  Wirble.colorize
end

# improve irb’s default output
Hirb::View.enable if defined? Hirb

# disable readline temporarily if current ruby impletation is rbx
unless RUBY_ENGINE == "rbx"
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
end if defined? RUBY_ENGINE

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

def dumphist(num, path)
  File.open(path, 'w') do |file|
    Readline::HISTORY.to_a[-num-1..Readline::HISTORY.length-3].each do |line|
      file.puts  line
    end
  end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

class String
  # uncompleted, need to strip js tags and other html formatters
  def strip_html
    self.gsub(/<\/?[^>]*>/, "")
  end
end

# load debug utility
require ENV['HOME'] + '/utils/ruby/debug.rb'
