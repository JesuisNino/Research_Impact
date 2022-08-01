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
class Project < ApplicationRecord
    has_many :fields

    validates :name, :description, :founder, presence: true
end
