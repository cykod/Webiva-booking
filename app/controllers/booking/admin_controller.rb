
class Booking::AdminController < ModuleController

  component_info 'Booking', :description => 'Booking support', 
  :access => :public

  # Register a handler feature
  register_permission_category :booking, "Booking" ,"Permissions related to Booking"

  register_permissions :booking, [ [ :manage, 'Manage Booking', 'Manage Booking' ],
  [ :config, 'Configure Booking', 'Configure Booking' ]
]
cms_admin_paths "options",
"Booking Options" => { :action => 'index' },
"Options" => { :controller => '/options' },
"Modules" => { :controller => '/modules' }

permit 'booking_config'

  content_model :bookings

  def self.get_bookings_info
    [ { :name => 'Booking Management', 
      :permission => :booking_manage,
      :url => { :controller => 'booking/manage' } 
      } ]
  end

  public 

  def options
    cms_page_path ['Options','Modules'],"Booking Options"

    @options = self.class.module_options(params[:options])

    if request.post? && @options.valid?
      Configuration.set_config_model(@options)
      flash[:notice] = "Updated Booking module options".t 
      redirect_to :controller => '/modules'
      return
    end    

  end

  def self.module_options(vals=nil)
    Configuration.get_config_model(Options,vals)
  end

  class Options < HashModel
    attributes :default_booking_name => 'Booking name'
    validates_presence_of :default_booking_name
  end

end
