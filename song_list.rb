require 'rspotify'
require 'dotenv/load'
require 'selenium-webdriver'

class SongList

  def initialize(songs_file_path)
    @songs_file_path = songs_file_path
    @yes_songs = File.open('yes_songs.txt', 'a')
    @no_songs = File.open('no_songs.txt', 'a')
    @maybe_songs = File.open('maybe_songs.txt', 'a')
    @driver = Selenium::WebDriver.for :chrome
    RSpotify.authenticate(ENV.fetch('SPOTIFY_CLIENT_ID'), ENV.fetch('SPOTIFY_CLIENT_SECRET'))
  end

  def run
    system('clear')

    File.open(@songs_file_path).each_line.with_index do |song, index|
      puts "Song ##{index + 1} of #{songs_count}"
      play_song(song)
      ask_about_song(song)
    end

    puts "🎉 🍻  Done! 🎉 🍻"
  end

  def play_song(song)
    track = RSpotify::Track.search(song).first

    if track && preview_url = track.preview_url
      @driver.get(preview_url)
    end
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
