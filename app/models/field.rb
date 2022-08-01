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
class Field < ApplicationRecord
    belongs_to :project
    has_many_attached :files
    validates :title, :field_type, :impactType, :date, presence: true
end
