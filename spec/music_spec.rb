require("rspec")
require("music")

describe("Music") do
  before() do
    Music.clear()
  end

  it("returns the name of the artist") do
    test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
    expect(test_cd.artist()).to(eq("Janelle Monae"))
  end

  it("returns the name of the album") do
    test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
    expect(test_cd.album()).to(eq(["The Electric Lady"]))
  end

  describe("#albums") do
    it("adds an album to an artist") do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      test_cd2 = Music.new({ :artist => "Janelle Monae", :album => "Queen" })
      test_cd.save()
      expect(test_cd.albums("Janelle Monae")).to(eq(["The Electric Lady", "Queen"]))
    end
  end

  describe(".all") do
    it("is empty") do
      expect(Music.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("add a cd to the array of saved cds") do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      expect(Music.all()).to(eq([test_cd]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved CDs") do
      Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      Music.clear()
      expect(Music.all()).to(eq([]))
    end
  end

  describe(".list") do
    it("prints a list of all cds") do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      test_cd2 = Music.new({ :artist => "Nirvana", :album => "Nevermind" })
      test_cd2.save()
      expect(Music.list()).to(eq([test_cd, test_cd2]))
    end
  end

  describe(".find_by_album") do
    it("returns the cd when searched by album") do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      test_cd2 = Music.new({ :artist => "Nirvana", :album => "Nevermind"})
      test_cd2.save()
      expect(Music.find_by_album("The Electric Lady")).to(eq(test_cd))
    end
  end

  describe(".find_by_artist") do
    it("returns the cd when searched by artist")do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      test_cd2 = Music.new({ :artist => "Nirvana", :album => "Nevermind" })
      test_cd2.save()
      expect(Music.find_by_artist("Janelle Monae")).to(eq(test_cd))
    end
  end

  describe("#id") do
    it("returns the ID of the CD") do
      test_cd = Music.new({ :artist => "Janelle Monae", :album => "The Electric Lady" })
      test_cd.save()
      expect(test_cd.id()).to(eq(1))
    end
  end
end
