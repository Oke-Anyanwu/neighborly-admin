module Neighborly
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Admin

      config.to_prepare do
        ::Project.send(:include, Neighborly::Admin::ProjectConcern)
      end
    end
  end
end
