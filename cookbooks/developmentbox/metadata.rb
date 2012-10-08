maintainer        "Mike Mulvaney"
maintainer_email  "mike.mulvaney@gmail.com"
license           "Apache 2.0"
description       "Installs a development box with the tools I need on it"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
depends           "apt"
depends           "rbenv"

recipe "developmentbox", "installs all development stuff"

%w{ ubuntu }.each do |os|
  supports os
end

