#
# Cookbook Name:: developmentbox
# Recipe:: default
#

# Add in emacs 24 via ppa
include_recipe "apt"

apt_repository "emacs24" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "8FBB7709281B6E626DD855CF84DBCE2DCEC45805"
end

execute "apt-get update"

package "emacs24"
package "emacs24-el"

# set up rbenv
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "1.9.3-p194"

rbenv_gem "bundler" do
  ruby_version "1.9.3-p194"
end

