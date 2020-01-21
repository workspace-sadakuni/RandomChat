# == Schema Information
#
# Table name: board_tag_relations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  tag_id     :integer
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'test_helper'

class BoardTagRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
