# == Schema Information
#
# Table name: fields
#
#  id         :bigint           not null, primary key
#  comments   :text
#  contacts   :text
#  date       :date
#  evidence   :text
#  field_type :string
#  impactType :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#
require 'rails_helper'

RSpec.describe Field, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
