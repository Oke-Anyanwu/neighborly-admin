module Neighborly
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Admin
    end
  end
end
