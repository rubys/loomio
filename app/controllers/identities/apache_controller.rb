class Identities::ApacheController < Identities::BaseController

  private

  def oauth_host
    "https://oauth.apache.org/auth"
  end
end
