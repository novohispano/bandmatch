class SongkickService
  def self.prepare
    Songkickr::Remote.new(ENV['SONGKICK_API_KEY'])
  end
end