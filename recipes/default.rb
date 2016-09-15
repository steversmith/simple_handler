# for some reason the chef_handler wants to put the handlers in a sibling 
# directory of the chef cache, instead of inside the chef cache
# e.g. /var/cache/handlers instead of /var/cache/chef/handlers
# 
# here is the original code for the chef_handler default attributes:
# node.default['chef_handler']['handler_path'] = "#{File.expand_path(File.join(Chef::Config[:file_cache_path], '..'))}/handlers"
node.default['chef_handler']['handler_path'] = "#{File.expand_path(File.join(Chef::Config[:file_cache_path]))}/handlers"

# ensure that the handler path directory exists
directory node['chef_handler']['handler_path'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# drop the handler code into place
cookbook_file "#{node['chef_handler']['handler_path']}/simple_handler.rb" do
  source 'simple_handler.rb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# setup the handler to execute on success (report handler) and failure (exception handler)
chef_handler 'Chef::Handler::SimpleHandler' do
  source "#{node['chef_handler']['handler_path']}/simple_handler.rb"
  supports  :report => true, :exception => true 
  action :enable
end

ruby_block 'fail the run' do
  block do
    # Uncomment this line to force a failure AFTER the handler is installed
    #fail 'deliberately fail the run'
  end
end
