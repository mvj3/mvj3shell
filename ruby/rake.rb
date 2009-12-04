require 'fileutils'
include FileUtils

namespace :firefox do
  task :config_path do
    firefox_config_path_on_osx = ( Dir.glob ENV["HOME"] + "/Library/Application\ Support/Firefox/Profiles/*.default" )[0]
    firefox_config_path_on_linux = ( Dir.glob ENV["HOME"] + "/.mozilla/firefox/*.default" )[0]
    FIREFOX_CONFIG_PATH = ( RUBY_PLATFORM =~ /darwin/ ? firefox_config_path_on_osx : firefox_config_path_on_linux )
    UTILS_PATH = ENV["HOME"] + "/utils"
  end

  desc "install all firefox's config files"
  task :install_all_firefox_config_files => [:install_gm_scripts, :install_stylish, :install_searchplugins] do
    puts "install successfully."
  end

  desc "install gm_scripts"
  task :install_gm_scripts => :config_path do
    rm_rf FIREFOX_CONFIG_PATH + "/gm_scripts"
    ln_s UTILS_PATH + "/firefox/gm_scripts", FIREFOX_CONFIG_PATH + "/gm_scripts"
  end

  desc "install stylish.rdf"
  task :install_stylish => :config_path do
    rm_f FIREFOX_CONFIG_PATH + "/stylish.rdf"
    ln_s UTILS_PATH + "/firefox/stylish.rdf", FIREFOX_CONFIG_PATH + "/stylish.rdf"
  end

  desc "install searchplugins"
  task :install_searchplugins => :config_path do
    rm_rf FIREFOX_CONFIG_PATH + "/searchplugins"
    ln_s UTILS_PATH + "/firefox/searchplugins", FIREFOX_CONFIG_PATH + "/searchplugins"
  end
end
