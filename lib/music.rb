class Music

  @@cds = []

  attr_reader(:artist, :album)

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @album = attributes.fetch(:album)
    @id = @@cds.length().+(1)
  end

  define_method(:albums) do #|album_search|
    albums = []
  #   @@cds.each() do |cd|
  #     if cd.include?(album_search)
  #       # if album_search.eql?(@artist)
        albums.push(@album)
  #     end
  #   end
  #   albums
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@cds
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:list) do
    @@cds
  end

  define_singleton_method(:find_by_album) do |search_album|
    found_cd = nil
    @@cds.each() do |cd|
      if cd.album().include?(search_album)
        found_cd = cd
      end
    end
    found_cd
  end

  define_singleton_method(:find_by_artist) do |search_artist|
    found_cd = nil
    @@cds.each() do |cd|
      if cd.artist().include?(search_artist)
        found_cd = cd
      end
    end
    found_cd
  end
end
