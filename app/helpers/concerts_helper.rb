module ConcertsHelper
  def artists_from(performances)
    performances.collect do |performance|
      performance.artist.display_name
    end.join(", ")
  end
end