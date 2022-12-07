module Pingpp
  class SettleAccount < UserBasedResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def verify(id, params, opts = {})
      response, opts = request(:post, "#{resource_url}/#{id}/verify", params, opts)
    end

    def self.object_name
      'identities'
    end
  end
end
