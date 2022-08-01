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
require 'rails_helper'

RSpec.describe Usertable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
