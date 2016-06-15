class Profiles::LocationsController < LocationsController
  before_action :set_locationable

  private
  def set_locationable
    @locationable = Profile.find(params[:profile_id])
  end
end
