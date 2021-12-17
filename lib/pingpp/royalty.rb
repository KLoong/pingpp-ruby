module Pingpp
  class Royalty < APIResource
    extend Pingpp::APIOperations::List

    def self.batch_update(params, opts={})
      response, opts = request(:put, resource_url(opts), params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.resource_url(opt={})
      '/v1/royalties'
    end

    def self.create(id, params, opts={})
      response, opts = request(:post, create_url(id), params, opts)
      Util.convert_to_pingpp_object(response, opts)
    end

    def self.create_url order_id
      "/v1/orders/#{order_id}/royalty_datas"
    end

  end
end
