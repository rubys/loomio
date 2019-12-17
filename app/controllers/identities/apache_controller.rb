class Identities::ApacheController < Identities::BaseController

  private

  def oauth_host
    "https://oauth.apache.org/auth"
  end

  def oauth_params
    super.merge(response_type: :code, state: 'thisisonlyforshow', redirect_uri: 'https://debate.apache.org/apache/authorize' )
  end

 def identity_params
    { access_token: params[:code] }
  end

end

