module ConcertsHelper
  def artists_from(performances)
    performances.collect do |performance|
      performance.artist.display_name
    end.join(", ")
  end

  def title_for(concert)
    "#{artists_from(concert.performances)} at #{concert.venue.display_name}"
  end
end