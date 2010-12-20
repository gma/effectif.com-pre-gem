require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :test)

begin
  require 'vlad'
  Vlad.load(:scm => :git, :app => nil, :web => nil)
rescue LoadError
end

