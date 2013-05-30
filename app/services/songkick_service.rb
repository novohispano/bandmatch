class SongkickService
  def self.prepare
    Songkickr::Remote.new(ENV['SONGKICK_API_KEY'])
  end

  def self.fetch_events(coordinates)
    prepare.events(location: "geo:#{coordinates}").results
  end
end