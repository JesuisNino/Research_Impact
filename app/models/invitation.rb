# == Schema Information
#
# Table name: invitations
#
#  id           :bigint           not null, primary key
#  email        :string
#  projectid    :bigint
#  projecttitle :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Invitation < ApplicationRecord
end
