module Trakt
  class Show < DataSet
    listify :seasons
    alias_property :tvdb_id, :id
    
    def seasons 
      @seasons ||= parent.find_seasons(title)
    end
    
    # 
    # def episodes(season = nil)
    #   if season
    #     parent.find_episodes(season)
    #   else
    #     @episodes ||= seasons.map(&:season).each do |season|
    #       parent.find_episodes(season)
    #     end
    #   end
    # end
    
  end
end
