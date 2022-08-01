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
class Usertable < ApplicationRecord
    has_one_attached :profile_image
    validates_presence_of :fname
end

