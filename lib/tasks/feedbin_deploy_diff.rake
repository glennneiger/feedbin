require_relative '../../config/boot'
require_relative '../../config/environment'

namespace :feedbin  do
  desc "Create a coupon code."
  task :deploy_diff do
    response = HTTParty.get('http://feedbin.dev/version', {timeout: 20})
    current_version = response.parsed_response.chomp
    path = "/feedbin/feedbin/compare/%s...master" % current_version
    uri = URI::HTTP.build(
      scheme: 'https',
      host: 'github.com',
      path: path
    )
    `open #{uri.to_s}`
  end
end