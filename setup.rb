#!/usr/bin/env ruby

topdir = File.absolute_path(File.dirname(__FILE__))

cookbooks_dir = File.join(topdir, 'cookbooks')

cookbooks = {}
["apt", "git", "java", "memcached", "runit", "build-essential", "yum", "windows",
  "chef_handler", "ohai"].each do |repo|
    cookbooks[repo] = "https://github.com/opscode-cookbooks/#{repo}.git"
end

cookbooks["rbenv"] = "https://github.com/RiotGames/rbenv-cookbook.git rbenv",

gitignore = File.open("#{cookbooks_dir}/.gitignore", 'w')
cookbooks.each do |name, url|
  Dir.chdir(cookbooks_dir)
  gitignore.puts(name)

  if File.directory?(name)
    Dir.chdir(name)
    system("git pull")
  else
    system("git clone #{url}")
  end
end
