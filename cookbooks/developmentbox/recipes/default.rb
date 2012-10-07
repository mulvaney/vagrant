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
end

execute "apt-get update"

package "emacs24"
package "emacs24-el"


