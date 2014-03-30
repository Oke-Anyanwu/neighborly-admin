module Neighborly::Admin
  class TagsController < BaseController
    actions :all, except: [:show]

    def create
      create! { tags_path }
    end

    def update
      update! { tags_path }
    end

    def destroy
      destroy! { tags_path }
    end

    def collection
      @tags ||= apply_scopes(end_of_association_chain).order('created_at desc').page(params[:page])
    end
  end
end
