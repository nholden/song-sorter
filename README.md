# Song Sorter

Listen to previews of songs and sort them into "yes," "no," and "maybe" buckets. This app made running through a 400+ song list from a wedding band fun and painless.

# Installation

```
git clone git://github.com/nholden/song-sorter
cd song-sorter
bundle install
cp .env.example .env
```

# Getting started

Create a list of song names separated by line breaks and save it in the root directory as `songs.txt`, or run `cp songs.txt.example songs.txt` to try out a list from [Young Love & The Thrills](http://www.youngloveandthethrills.com/). [Create a new Spotify Application](https://developer.spotify.com/my-applications/#!/applications/create) and update `.env` with your application's client ID and client secret.

Run `ruby song_sorter.rb`. Your selections will be saved in text files in the root directory called `yes_songs.txt`, `no_songs.txt`, and `maybe_songs.txt`.

# Notes

The Spotify track search via [rspotify](https://github.com/guilhermesad/rspotify) does a pretty good job at finding songs no matter how you’ve formatted track names. Including artist names tends to be useful, especially for common song names. Even with well-formatted names, the Spotify track search is sure to return some bad covers and weird karaoke versions of songs.

# Contributing

Contributions are welcome from everyone! Feel free to make a pull request or use GitHub issues for help getting started, to report bugs, or to make feature requests.

# License

This project was created by [Nick Holden](http://nickholden.io) and is licensed under the terms of the MIT license.
