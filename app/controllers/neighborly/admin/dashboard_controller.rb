class Neighborly::Admin::DashboardController < Admin::ApplicationController
  inherit_resources
  defaults  resource_class: Statistics
  actions :index
end

