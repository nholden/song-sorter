class SongList

  def initialize(songs_file_path)
    @songs_file_path = songs_file_path
    @yes_songs = File.open('yes_songs.txt', 'a')
    @no_songs = File.open('no_songs.txt', 'a')
    @maybe_songs = File.open('maybe_songs.txt', 'a')
  end

  def run
    system('clear')

    File.open(@songs_file_path).each_line.with_index do |song, index|
      puts "Song ##{index + 1} of #{songs_count}"
      ask_about_song(song)
    end

    puts "🎉 🍻  Done! 🎉 🍻"
  end

  def ask_about_song(song)
    puts song
    puts "Yes (y), no (n), or maybe (m)?"
    response = gets.chomp.downcase

    case response
    when 'y'
      @yes_songs << song
      system('clear')
    when 'n'
      @no_songs << song
      system('clear')
    when 'm'
      @maybe_songs << song
      system('clear')
    else
      puts "Invalid response"
      ask_about_song(song)
    end
  end

  def songs_count
    @songs_count ||= File.open(@songs_file_path).count
  end

end

SongList.new('songs.txt').run
