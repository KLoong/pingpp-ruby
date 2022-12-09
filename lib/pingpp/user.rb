module Pingpp
  class User < AppBasedResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def self.send_sms(id, opts = {})
      response, opts = request(:post, new_method_url(id, 'send_sms'), opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.reset_password(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'passwords'), params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.update_password(id, params, opts = {})
      response, opts = request(:put, new_method_url(id, 'passwords'), params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    # 证件上传
    def self.upload_pic(params, opts = {})
      response, opts = request(:post, "#{resource_url}/upload_pic", params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    # 发送验证短信
    def self.verify_send_sms(params, opts = {})
      response, opts = request(:post, "#{resource_url}/send_sms", params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.identities_renew(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'identities_renew'), params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.new_method_url(id, function)
      "#{resource_url}/#{id}/#{function}"
    end
  end
end
