require 'httparty'

module Trakt
  class Client
    include HTTParty
    format :json
    base_uri "http://api.trakt.tv/"
    
    attr_accessor :api_key, :username, :password, :auth

    # Creates an instance of the Trakt interface
    # Trakt.new('some_key')
    def initialize(api_key, username = nil, password = nil)
      self.api_key = api_key
      self.username = username
      self.password = password
      self.auth = {:username => @username, :password => @password}
      # check_api_key!
    end

    def find_calendar_shows(date = nil, days = nil)
      date = date.strftime("%Y%m%d") if date
      result = get_with_optional("calendar/shows.json/#{@api_key}", username, date, days)
      shows = []
      result.each do |res|
        shows << Show.new(self, res)
      end
      shows
    end
    
    def find_calendar_shows_by_user(username = @username, date = nil, days = nil)
      date = date.strftime("%Y%m%d") if date
      result = get_with_optional("user/calendar/shows.json/#{@api_key}/#{username}", date, days)
      shows = []
      result.each do |res|
        shows << Show.new(self, res)
      end
      shows
    end
    
    def find_collected_shows(username = @username, extended = nil)
      result = get_with_optional("user/library/shows/collection.json/#{@api_key}/#{username}", extended)
      shows = []
      result.each do |res|
        shows << Show.new(self, res)
      end
      shows
    end
    
    def find_episodes(title, season)
      result = get_with_optional("show/season.json/#{@api_key}/#{sluglize(title)}/#{season}")
      episodes = []
      result.each do |res|
        episodes << Episode.new(self, title, season, res)
      end
      episodes
    end
    
    def find_seasons(title)
      result = get_with_optional("show/seasons.json/#{@api_key}/#{sluglize(title)}")
      seasons = []
      result.each do |res|
        seasons << Season.new(self, title, res)
      end
      seasons
    end
    
    def find_episode(title, season, episode)
      result = get_with_optional("show/episode/summary.json/#{@api_key}/#{sluglize(title)}/#{season}/#{episode}")
      Episode.new(self, title, season, result)
    end
    
    def find_show(title)
      result = get_with_optional("show/summary.json/#{@api_key}/#{sluglize(title)}")
      Show.new(self, result)
    end
    
    def remove_from_library(title)
      result = self.class.post("/show/unlibrary/#{@api_key}", :body => @auth.merge({:title => title, :year => "2006"}))
      puts result.inspect
    end

    protected
    
      def sluglize(title)
        if title.is_a?(String)
          title.downcase.gsub(" ", "-")
        else
          title
        end
      end

      # Returns the given json as a hash appending optional arguments to the url
      # tvdb.get_with_optional("/some/url", arg1, arg2)
      def get_with_optional(*args)
        url = ""
        args.each do |arg|
          url += "/#{arg}" if arg
        end
        begin
          puts url
          self.class.get(url, :basic_auth => @auth)
        rescue Exception => e
          { 'Data' => nil }
        end
      end


  end
end
