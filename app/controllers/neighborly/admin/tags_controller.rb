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

    protected
    def collection
      @tags ||= apply_scopes(end_of_association_chain).order('created_at desc').page(params[:page])
    end

    def permitted_params
      params.permit({ tag: Tag.attribute_names.map(&:to_sym) })
    end
  end
end
