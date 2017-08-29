require 'HTTParty'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'

    def initialize(email, password)
        response = self.class.post('#{BASE_URI}/sessions', body: { 'email': email, 'password': password })
        raise "Invalid email or password" if response.code == 401
        @auth = response['auth_token']
    end

end
