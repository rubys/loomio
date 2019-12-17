
class Identities::Apache < Identities::Base
  include Identities::WithClient
  set_identity_type :apache

  def apply_user_info(payload)
    self.uid   ||= payload['uid']
    self.name  ||= payload['fullname']
    self.email ||= payload['email']
    # self.logo  ||= payload['picture']
  end
end

