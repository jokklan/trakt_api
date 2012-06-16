module Trakt
  class Episode < DataSet
    
    attr_accessor :season_num
    attr_accessor :show_title
    
    def initialize(parent = nil, title = nil, num = nil, *args)
      self.season_num = num;
      self.show_title = title;
      super(parent, *args)
    end
    
    def season
      @season ||= parent.find_season(show_title, season_num)
    end
    
    def show
      @show ||= parent.find_show(show_title)
    end
    
  end
end