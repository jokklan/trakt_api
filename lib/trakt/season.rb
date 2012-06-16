module Trakt
  class Season < DataSet
    attr_accessor :show_title
    listify :genre, :actors
    
    def initialize(parent = nil, title = nil, *args)
      self.show_title = title;
      super(parent, *args)
    end
    
    def episodes
      @episodes ||= parent.find_episodes(show_title, season) if title
    end
    
    def episode(num)
      @episodes.select{|s| s.episode == num}
    end
    
    def show
      @show ||= parent.find_show(show_title)
    end
    
  end
end