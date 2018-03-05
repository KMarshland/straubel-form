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
#  name       :string
#  campaign   :string
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

  after_commit :create_event, on: :create

  def create_event
    Event.create(
             session: self.session,
             view: self.view,
             time: DateTime.now,
             kind: 'success'
    )
  end

  def self.to_csv
    csv = ['id', 'email', 'name', 'campaign', 'created_at', *QUESTIONS.map{|_key, q| q[:title].gsub(',', '')}].join(',') + "\n"

    all.each do |response|
      csv += [
          response.id,
          response.email,
          response.name,
          response.campaign,
          response.created_at,
          *QUESTIONS.map{|key, _q| response.answers[key]}
      ].join(',') + "\n"
    end

    csv
  end

end
