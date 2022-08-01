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
#
require 'rails_helper'

# This file contains unit tests for users

RSpec.describe User, type: :model do

  describe '#project' do

    it 'is valid a project' do
      project = build(:project)
      expect(project).to be_valid
    end


    it 'is invalid a project' do
      project = build(:project, name: nil)
      expect(project).to_not be_valid
      expect(project.errors[:name]).to include("can't be blank")
    end
  end
end
