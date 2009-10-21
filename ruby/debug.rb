class Object
  def non_class_methods
    self.methods - Class.methods
  end
  alias ncm non_class_methods

  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
  alias lm local_methods
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

def clear
  system 'clear'
end

## Aliases
alias q exit
alias p pp
