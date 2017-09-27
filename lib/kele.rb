require 'HTTParty'
require 'json'
require_relative 'roadmap'

class Kele
    include HTTParty

    BASE_URI = 'https://www.bloc.io/api/v1'

    def initialize(email, password)
        response = self.class.post("#{BASE_URI}/sessions", body: { 'email': email, 'password': password })
        raise "Invalid email or password" if response.code == 401
        @auth_token = response['auth_token']
    end

    def get_me
        response = self.class.get("#{BASE_URI}/users/me", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
    id = mentor_id.to_s
    response = self.class.get("#{BASE_URI}/mentors/" + id + "/student_availability", headers: { "authorization" => @auth_token })
    slots = JSON.parse(response.body)
slots
end




end
