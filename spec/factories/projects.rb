# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  active      :boolean
#  description :text
#  end         :date
#  founder     :string
#  grant       :string
#  invites     :string
#  name        :string
#  start       :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :project do
    name { "Test Project" }
    description { "Test description for a project" }
    founder { "Joe Bloggs" }
    grant { "25000" }
    start { "2022-04-23" }
    # end { "2022-04-23" }
    add_attribute(:end) { "2022-04-24" } #end is a reserved ruby word so use this line instead of line 24
    active { false }
  end
end
