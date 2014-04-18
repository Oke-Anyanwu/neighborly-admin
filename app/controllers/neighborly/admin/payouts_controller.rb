module Neighborly::Admin
  class PayoutsController < BaseController
    inherit_resources
    actions :create

    def create
      @payout = Payout.new(
        manual:          true,
        payment_service: params.fetch(:payment_service),
        project_id:      params.fetch(:project_id),
        user_id:         current_user.id,
        value:           params.fetch(:net_amount),
      )
      create! { project_financials_by_service_index_path }
    end

    def process_new
    end

    protected

    def permitted_params
      params.require(:payout).permit!
    end
  end
end
