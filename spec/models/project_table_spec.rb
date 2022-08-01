# == Schema Information
#
# Table name: project_tables
#
#  id                 :bigint           not null, primary key
#  end_date           :string
#  founder_name       :string
#  grant_name         :string
#  is_active          :boolean
#  projectdescription :text
#  projecttitle       :string
#  start_date         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe ProjectTable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
