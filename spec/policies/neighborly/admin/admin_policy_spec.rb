require 'spec_helper'

describe Neighborly::Admin::AdminPolicy do
  subject { described_class }

  permissions :access? do
    it 'denies access if user is nil' do
      expect(subject).not_to permit(nil, Neighborly::Admin)
    end

    it 'denies access if user is not admin' do
      expect(subject).not_to permit(User.new, Neighborly::Admin)
    end

    it 'permits access if user is admin' do
      user = User.new
      user.admin = true
      expect(subject).to permit(user, Neighborly::Admin)
    end
  end
end

