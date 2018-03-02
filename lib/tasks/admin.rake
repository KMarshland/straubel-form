
task :clean_up_campaign_stats => :environment do

  Response.find_each do |response|

    Event.where(session: response.session).update_all(campaign: response.campaign)

  end

end
