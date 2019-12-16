class Clients::Apache < Clients::Base

  def default_host
    "https://oauth.apache.org/auth".freeze
  end
end
