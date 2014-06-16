module Neighborly::Admin
  class Reports::BaseController < BaseController
    inherit_resources
    respond_to :csv
    actions :index
  end
end
