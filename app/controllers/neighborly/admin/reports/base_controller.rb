class Admin::Reports::ApplicationController < Admin::ApplicationController
  inherit_resources
  responders :csv
  respond_to :csv
  actions :index
end
