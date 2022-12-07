module Pingpp
  class User < APIResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def self.send_sms(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'send_sms'), params, opts)
      initialize_from(response, opts)
    end

    def self.reset_password(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'passwords'), params, opts)
      initialize_from(response, opts)
    end

    def self.update_password(id, params, opts = {})
      response, opts = request(:put, new_method_url(id, 'passwords'), params, opts)
      initialize_from(response, opts)
    end

    # 证件上传
    def self.upload_pic(params, opts = {})
      response, opts = request(:post, "#{resource_url}/upload_pic", params, opts)
      initialize_from(response, opts)
    end

    def self.verify_send_sms(params, opts = {})
      response, opts = request(:post, "#{resource_url}/send_sms", params, opts)
      initialize_from(response, opts)
    end

    def self.new_method_url(id, function)
      "#{resource_url}/#{id}/#{function}"
    end
  end
end
