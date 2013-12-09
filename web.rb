require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'

class CombatStat < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(ENV['CLEARDB_DATABASE_URL'] || 'mysql2://root@localhost/ta_group_comsim')

get '/comsims/report/:target/:source' do
  CombatStat.transaction do
    CombatStat.destroy_all(:target => params[:target], :source => params[:source])
    CombatStat.create :target => params[:target], :source => params[:source], :outcome => params[:outcome], :duration => params[:duration], :base => params[:base], :total => params[:total], :base => params[:base], :defense => params[:defense], :cy => params[:cy], :df => params[:df], :cc => params[:cc], :rt => params[:rt], :base_rt => params[:base_rt], :infantry_rt => params[:infantry_rt], :vehicle_rt => params[:vehicle_rt], :aircraft_rt => params[:aircraft_rt]
  end
  "OK"
end

get '/comsims/get/:target/:source' do
  CombatStat.where.not(:source => params[:source]).where(:target => params[:target]).group("target, source").order("id DESC").to_json
end
