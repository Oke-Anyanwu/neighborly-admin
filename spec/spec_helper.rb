# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'sidekiq/testing'
require 'pundit/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include FactoryGirl::Syntax::Methods

  # Stubs and configuration
  config.before(:each) do
    result = OpenStruct.new 'latitude'     => 40.7143528,
                            'longitude'    => -74.0059731,
                            'address'      => 'New York, NY, USA',
                            'state'        => 'New York',
                            'state_code'   => 'NY',
                            'country'      => 'United States',
                            'country_code' => 'US'
    Geocoder.stub :search => [Geocoder::Result::Base.stub(:new).and_return(result)]
    Geocoder.stub :coordinates => [result.latitude, result.longitude]

    CatarseMailchimp::API.stub(:subscribe).and_return(true)
    CatarseMailchimp::API.stub(:unsubscribe).and_return(true)
    Project.any_instance.stub(:store_image_url).and_return('http://www.store_image_url.com')
    ProjectObserver.any_instance.stub(:after_create)
    UserObserver.any_instance.stub(:after_create)
    Project.any_instance.stub(:download_video_thumbnail)
    Notification.stub(:notify)
    Notification.stub(:notify_once)
  end
end
