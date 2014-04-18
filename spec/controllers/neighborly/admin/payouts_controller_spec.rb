require 'spec_helper'

describe Neighborly::Admin::DashboardController do
  routes { Neighborly::Admin::Engine.routes }
  let(:admin)   { create(:user, admin: true) }
  let(:project) { create(:project, admin: true) }
  before do
    controller.stub(:current_user).and_return(admin)
  end

  describe 'POST \'create\'' do
    def do_request
      post :create, payment_service: 'balanced', project_id: project.id, net_amount: 40.2
    end

    it 'creates a new manual payout' do
      expect {
        do_request
      }.to change(Payout, :count).by(1)
      expect(Payout.last).to be_manual
    end

    it 'defines the new payout with received attributes' do
      do_request
      payout = Payout.last
      expect(payout.payment_service).to eql('balanced')
      expect(payout.project_id).to eql(project.id)
      expect(payout.net_amount.to_f).to eql(40.2)
    end

    it 'defines current user as responsible of the payout' do
      do_request
      expect(Payout.last.user).to eql(admin)
    end

    it 'redirects to list of financials by service page' do
      do_request
      expect(response).to redirect_to(project_financials_by_service_index_path)
    end
  end
end
