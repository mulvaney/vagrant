#!/usr/bin/env ruby

topdir = Dir.pwd

cookbooks_dir = File.join(topdir, 'cookbooks')

cookbooks = {
    "apt" => "https://github.com/opscode-cookbooks/apt.git",
    "java" => "https://github.com/opscode-cookbooks/java.git",
    "memcached" => "https://github.com/opscode-cookbooks/memcached.git"
}

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
