# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  session    :uuid
#  view       :uuid
#  answers    :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#
# Indexes
#
#  index_responses_on_session  (session)
#  index_responses_on_view     (view)
#

class Response < ApplicationRecord

  validates :session, presence: true
  validates :view, presence: true
  validates :answers, presence: true
  validates :email, presence: true

end
