class User < ActiveRecord::Base
  acts_as_authentic
  has_many :essays
  # has_and_belongs_to_many :essays


  # t.string    :username,               :null => false                # optional, you can use email instead, or both
  # t.string    :email,               :null => false                # optional, you can use login instead, or both
  # # t.string    :crypted_password,    :null => false                # optional, see below
  # # t.string    :password_salt,       :null => false                # optional, but highly recommended
  # t.string    :password,       :null => false                # optional, but highly recommended
  # t.string    :persistence_token,   :null => false                # required

end
