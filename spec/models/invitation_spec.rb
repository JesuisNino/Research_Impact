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
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
