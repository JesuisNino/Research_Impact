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
FactoryBot.define do
  factory :project_table do
    projecttitle { "MyString" }
    projectdescription { "MyText" }
    founder_name { "MyString" }
    grant_name { "MyString" }
    start_date { "MyString" }
    end_date { "MyString" }
    is_active { false }
  end
end
