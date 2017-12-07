class MapController < ApplicationController
  def index
    @insts = Inst.all
    @hash = Gmaps4rails.build_markers(@insts) do |inst, marker|
      marker.lat inst.latitude
      marker.lng inst.longitude
      marker.infowindow inst.description
      marker.json({title: inst.title})
    end
  end
end
