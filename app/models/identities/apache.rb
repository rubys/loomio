class Identities::Apache < Identities::Base
  include Identities::WithClient
  set_identity_type :apache

  def apply_user_info(payload)
    self.uid   ||= payload['id']
    self.name  ||= payload['name']
    self.email ||= payload['email']
    # self.logo  ||= payload['picture']
  end
end
