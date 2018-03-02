class AddCampaignToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :campaign, :string
  end
end
