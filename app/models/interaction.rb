# == Schema Information
#
# Table name: interactions
#
#  id               :integer          not null, primary key
#  description      :string
#  interactive_id   :integer
#  interactive_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_interactions_on_interactive_type_and_interactive_id  (interactive_type,interactive_id)
#

class Interaction < ActiveRecord::Base

	belongs_to :interactive, polymorphic: true
	
end
