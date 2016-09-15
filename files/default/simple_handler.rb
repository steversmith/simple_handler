require 'chef/handler'

class Chef
  class Handler

    class SimpleHandler < Chef::Handler
      def report
        Chef::Log.warn("SimpleHandler: @run_status.success? => #{@run_status.success?}")
      end
    end
  end
end