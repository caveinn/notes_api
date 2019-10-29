class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authorize_request 
    attr_reader :currenta_user

    private

    def authorize_request
        @currenta_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
