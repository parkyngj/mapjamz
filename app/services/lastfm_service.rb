module LastFmService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']

  def self.top_tracks(country)
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&limit=10&api_key=#{KEY}"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response
    track_list = parsed_response['lfm']['tracks']['track']

    hipster_paragraph = "Yolo pour-over viral kombucha. Gentrify tumblr actually fap chillwave 90's whatever retro messenger bag. Normcore single-origin coffee vice five dollar toast gluten-free meh tacos intelligentsia. Cardigan quinoa ethical wayfarers hashtag."
    
    track_list.map do |track|
      {name: track['name'],
       artist: track['artist']['name'],
       image_url: track['image'][3]['__content__'],
       summary: hipster_paragraph}
    end
  end
end


# module LastFmService
#   include HTTParty

#   KEY = ENV['LAST_FM_API_KEY']

#   def self.song_info(artist,song)
#     url = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=9fc86c40ce0f4704f7e83f97c491ddfa&artist=#{artist}&track=#{song}&format=json"

#     if url.ascii_only?
#       response = HTTParty.get(url)

#       parsed_response = response.parsed_response["track"]
#     else
#       encoding_options = {
#   :invalid           => :replace,  # Replace invalid byte sequences
#   :undef             => :replace,  # Replace anything not defined in ASCII
#   :replace           => '',        # Use a blank for those replacements
#   :universal_newline => true       # Always break lines with \n
# }
#       "Meditation kale chips locavore 8-bit venmo pabst. Tilde carry chambray kickstarter actually mixtape chicharrones polaroid. Blog street loko schlitz. Lo-fi crucifix heirloom ethical wes anderson. Kinfolk quinoa pop-up vice pbr&b selfies xoxo post-ironic. Health leggings bespoke sustainable. Meh pop-up hashtag wolf yuccie scenester. Tote bag chicharrones five dollar toast squid 90's try-hard vinegar bitters."

#       url = url.encode(Encoding.find('ASCII'), encoding_options)

#       response = HTTParty.get(url)

#       parsed_response = response.parsed_response["track"]
#     end
#   end

#   def self.get_song_summary(artist,song)
#     if song_info(artist,song)["wiki"]
#       song_info(artist,song)["wiki"]["summary"].gsub("\n", "").gsub(/(\s*\<.*\/.*\>.?)/, '')
#     else
#       "Meditation kale chips locavore 8-bit venmo pabst. Tilde carry chambray kickstarter actually mixtape chicharrones polaroid. Blog street loko schlitz. Lo-fi crucifix heirloom ethical wes anderson. Kinfolk quinoa pop-up vice pbr&b selfies xoxo post-ironic. Health leggings bespoke sustainable. Meh pop-up hashtag wolf yuccie scenester. Tote bag chicharrones five dollar toast squid 90's try-hard vinegar bitters."
#     end
#   end

#   def self.top_tracks(country)
#     url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&limit=25&api_key=#{KEY}"

#     response = HTTParty.get(url)

#     parsed_response = response.parsed_response
#     track_list = parsed_response['lfm']['tracks']['track']
    
#     # iterate through track list and make track hashes with all attributes for track
#     track_list.map do |track|
#       p track['name']
#       p track['artist']['name']
#       p LastFmService.get_song_summary(track['name'], track['artist']['name'])

#       track_hash = {name: track['name'],
#        artist: track['artist']['name'],
#        image_url: track['image'][3]['__content__'],
#        summary: LastFmService.get_song_summary(track['name'], track['artist']['name'])}

#       p track_hash
#     end
#   end
# end

