# == Schema Information
#
# Table name: businesses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Business < ActiveRecord::Base

	has_many :interactions, as: :interactive, dependent: :destroy
	
end
