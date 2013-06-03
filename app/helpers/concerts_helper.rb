module ConcertsHelper
  def artists_from(performances)
    artists = ""

    performances.each do |performance|
      artists << "#{performance.artist.display_name}, "
    end

    artists.chop.chop
  end
end