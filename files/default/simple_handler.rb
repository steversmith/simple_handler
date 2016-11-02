require 'chef/handler'
#require 'json'

class Chef
  class Handler

    class SimpleHandler < Chef::Handler
      def report
        Chef::Log.warn("SimpleHandler: @run_status.success? => #{@run_status.success?}")

        Chef::Log.warn("Updated Resources:")
        @run_status.updated_resources.each {|r| Chef::Log.warn("  #{r.to_s}")}

      end
    end
  end
end