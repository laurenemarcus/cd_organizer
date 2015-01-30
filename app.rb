require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/music")

get("/") do
  @cds = Music.all()
  erb(:index)
end

post("/") do
  artist = params.fetch("artist")
  album = params.fetch("album")
  @cd = Music.new({ :artist => artist, :album => album })
  @cd.save()
  redirect("/")
end

post("/results") do
  more_albums = params.fetch("more_albums")
  @cd = Music.new({ :artist => artist, :album => album })
  @cd.save
  @album_id = Music.find_by_album(params.fetch("album_id")).to_i
  @album_id.album(@cd)
  redirect("/results")
end

get("/results/:id") do
  @album_id = Music.find_by_album(params.fetch('id').to_i())
  erb(:results)
end
