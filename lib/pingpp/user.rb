module Pingpp
  class User < AppBasedResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def send_sms(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'send_sms'), params, opts)
      initialize_from(response, opts)
    end

    def reset_password(id, params, opts = {})
      response, opts = request(:post, new_method_url(id, 'passwords'), params, opts)
      initialize_from(response, opts)
    end

    def update_password(id, params, opts = {})
      response, opts = request(:put, new_method_url(id, 'passwords'), params, opts)
      initialize_from(response, opts)
    end

    # 证件上传
    def upload_pic(params, opts = {})
      response, opts = request(:post, "#{resource_url}/upload_pic", params, opts)
      initialize_from(response, opts)
    end

    def new_method_url(id, function)
      "#{resource_url}/#{id}/#{function}"
    end
  end
end
