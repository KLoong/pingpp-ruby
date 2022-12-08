module Pingpp
  class Identity < UserBasedResource
    extend Pingpp::APIOperations::Create
    extend Pingpp::APIOperations::List
    include Pingpp::APIOperations::Delete
    include Pingpp::APIOperations::Update

    def self.object_name
      'identitie'
    end
  end
end
