module Trakt
  autoload :Client,     'trakt/client'
  autoload :DataSet,    'trakt/data_set'
  autoload :Show,       'trakt/show'
  autoload :Episode,    'trakt/episode'
  autoload :Season,     'trakt/season'
  
  class << self
    def new(*args)
      Trakt::Client.new(*args)
    end
  end
end
