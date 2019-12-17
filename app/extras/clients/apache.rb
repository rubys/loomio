class Clients::Apache < Clients::Base

  def default_host
    "https://oauth.apache.org/".freeze
  end

  def fetch_access_token(code, uri)
  end

  def fetch_user_info
    get "token"
  end

  def token_name
    :code
  end
end

