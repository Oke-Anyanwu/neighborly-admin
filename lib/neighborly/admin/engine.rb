module Neighborly
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Admin

      initializer 'include concerns' do |app|
        ::Project.send(:include, Neighborly::Admin::ProjectConcern)
      end
    end
  end
end
