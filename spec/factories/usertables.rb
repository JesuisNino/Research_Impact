# == Schema Information
#
# Table name: usertables
#
#  id             :bigint           not null, primary key
#  department     :string
#  email          :string
#  fname          :string
#  is_admin       :boolean
#  is_super_admin :boolean
#  profilepic     :string
#  sname          :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :usertable do
    fname { "Joe" }
    sname { "Oscar" }
    department { "Computer Science" }
    email { "yzhang341@sheffield.ac.uk" }
    title { "Dr." }
    profilepic { "MyProfile" }
  end
  factory :invalid_usertable do
    fname nil
  end
end
