class ApplicationController < ActionController::Base
=begin    
    before_action :do_something

    private

    def do_something
        redirect_to "https://google.com"
    end
=end
end
