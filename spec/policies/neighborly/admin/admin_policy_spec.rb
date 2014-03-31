require 'spec_helper'

describe Neighborly::Admin::AdminPolicy do
  subject { described_class }

  permissions :access? do
    it 'should deny access if user is nil' do
      should_not permit(nil, Neighborly::Admin)
    end

    it 'should deny access if user is not admin' do
      should_not permit(User.new, Neighborly::Admin)
    end

    it 'should permit access if user is admin' do
      user = User.new
      user.admin = true
      should permit(user, Neighborly::Admin)
    end
  end
end

