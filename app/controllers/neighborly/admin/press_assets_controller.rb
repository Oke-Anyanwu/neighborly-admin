module Neighborly::Admin
  class PressAssetsController < BaseController
    actions :all, except: [:show]

    def collection
      @press_assets ||= apply_scopes(end_of_association_chain).page(params[:page])
    end
  end
end
