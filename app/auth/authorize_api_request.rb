class AuthorizeApiRequest
    def initialize(headers ={})
        @headers = headers
    end

    def call
        {
            user: user
        }
    end

    private

    attr_reader :headers

    def user
        @user ||= User.find(decoded_auht_token[:user_id]) if decoded_auht_token
        rescue ActiveRecord::RecordNotFound => e

            raise(
                ExceptionHandler::InvalidToken,
                ("#{Message.invalid_token} #{e.meessage}")
            )
        end

        def decoded_auht_token
            @decoded_auht_token ||= JsonWebToken.decode(http_auth_header)
        end

        def http_auth_header
            if headers['Authorization'].present?
                return headers["Authorization"].split(' ').last
            end
            raise(ExceptionHandler::MissingToken, Message.missing_token)
            end
    end