# encoding: utf-8
require 'omniauth'
require 'rack'
require 'restforce'

module OmniAuth
  module Strategies
    # OmniAuth strategy for Salesforce.com
    class SfdcBackground
      include OmniAuth::Strategy

      args [:consumer_key, :consumer_secret]
      uid { auth_info.id }
      info do
        {
          id: identity.Id,
          email: identity.Email,
          first_name: identity.FirstName,
          last_name: identity.LastName,
          image: identity.SmallPhotoUrl
        }
      end

      credentials do
        {
          username: username,
          password: password,
          oauth_token: client_options[:oauth_token],
          instance_url: client_options[:instance_url]
        }
      end

      extra do
        {
          user_id: identity.Id,
          instance_url: client_options[:instance_url],
          raw_info: identity,
          client: client
        }
      end

      option :fields, [:username, :password]
      option :params, username: 'username', password: 'password'
      option :host, 'login.salesforce.com'
      option :name, 'sfdc_background'

      def request_phase
        if valid_credentials?
          r = ::Rack::Response.new
          r.redirect(callback_path, 307)
          r.finish
        else
          build_form.to_response
        end
      end

      def callback_phase
        return fail!(:invalid_credentials) unless identity
        super
      end

      def identity
        return unless valid_credentials? && auth_info
        @identity ||= client.find('User', parse_id(auth_info.id))
      end

      private

      def parse_id(url)
        /(?<sfdc_id>[A-Za-z0-9]+)$/ =~ url && sfdc_id
      end

      def valid_credentials?
        username && password
      end

      def username
        request.params[options.params.username]
      end

      def password
        request.params[options.params.password]
      end

      def client_options
        return fail!(:invalid_credentials) unless identity
        client.options
      end

      def client
        @client ||= ::Restforce.new host: options.host,
                                    username: username, password: password,
                                    client_id: options.consumer_key,
                                    client_secret: options.consumer_secret
      end

      def auth_info
        @auth_info ||= client.authenticate!
      rescue ::Restforce::AuthenticationError
        nil
      end

      def build_form
        ::OmniAuth::Form.build(
          title: options[:title] || 'Salesforce Authentication',
          url: callback_path
        ) do |f|
          f.text_field 'Username', options.params.username
          f.password_field 'Password', options.params.password
        end
      end
    end
  end
end
