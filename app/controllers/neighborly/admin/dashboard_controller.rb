module Neighborly::Admin
  class DashboardController < ApplicationController
    inherit_resources
    defaults  resource_class: Statistics
    actions :index
  end
end

