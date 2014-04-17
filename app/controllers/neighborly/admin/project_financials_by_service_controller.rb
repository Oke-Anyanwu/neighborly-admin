module Neighborly::Admin
  class ProjectFinancialsByServiceController < BaseController
    inherit_resources
    actions :index
    has_scope :page, default: 1
  end
end
