module Pingpp
  class SettleAccount < UserBasedResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def self.verify(id, params, opts = {})
      response, opts = request(:post, "#{resource_url}/#{id}/verify", params, opts)
      initialize_from(response, opts)
    end

    def self.object_name
      'settle_account'
    end
  end
end
