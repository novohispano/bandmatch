module ConcertsHelper
  def artists_from(performances)
    performances.collect do |performance|
      performance.artist.display_name
    end.join(", ")
  end

  def title_for(concert)
    artists= artists_from(concert.performances)
    "#{artists_formatter(artists)} at #{concert.venue.display_name}"
  end

  def artists_formatter(string)
    if string.length >= 100
      "#{string[0..100]}(...)"
    else
      string
    end
  end
end