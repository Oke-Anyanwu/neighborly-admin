class Admin::PressAssetsController < Admin::ApplicationController
  actions :all, except: [:show]

  def collection
    @press_assets ||= apply_scopes(end_of_association_chain).page(params[:page])
  end
end
