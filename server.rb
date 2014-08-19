require 'sinatra'

require 'CSV'
  players = []
  CSV.foreach('rosters.csv', headers: true) do |row|
    players << row.to_hash
  end


  get '/team/:team_name' do
    @team_name = params[:team_name]
    @players = []
    players.each do |player|
      if player['team'] == @team_name
        @players << player
      end
    end
    erb :team
  end

  get '/position/:position_name' do
    @position = params[:position_name]
    @each_position = []
    players.each do |player|
      if player['position'] == @position
        @each_position << player
      end
    end
    erb :position
  end

  # Manual way to do each
  # get '/jetson_jets' do
  #   @players = players
  #   erb :jetson_jets
  # end




# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
