# == Schema Information
#
# Table name: invites
#
#  id         :bigint           not null, primary key
#  email      :string
#  project    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Invite < ApplicationRecord
end
