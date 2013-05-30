class SongKickService
  def self.prepare
    Songkickr::Remote.new(SONGKICK_API_KEY)
  end
end