module Neighborly
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace Neighborly::Admin

      config.to_prepare do
        ::Project.send(:include, Neighborly::Admin::ProjectConcern)
        ::User.send(:include, Neighborly::Admin::UserConcern)
        ::Contribution.send(:include, Neighborly::Admin::ContributionConcern)
      end
    end
  end
end
