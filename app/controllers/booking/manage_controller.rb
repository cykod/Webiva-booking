class Booking::ManageController < ModuleController      

  component_info 'Booking'     
  permit :booking_manage

  cms_admin_paths "content",
  "Booking" =>  {:action => 'index'}

  active_table :request_table, BookingRequest, 
  [:check, :name, :phone, :request_date, :request_time, 
    hdr(:number,:adult_count,:label => 'Adults'),hdr(:number,:child_count,:label => 'Children'),:created_at]

    def display_request_table(display=true)
      active_table_action('request') do |act,pid|
        case act
          when 'delete': BookingRequest.destroy(pid)
        end     
      end
      @tbl = request_table_generate(params,:order => 'created_at DESC')
      render :partial => 'request_table' if display
    end

    def index
      cms_page_path ["Content"], "Booking"
      display_request_table(false)
    end

    def edit
      @request = BookingRequest.find_by_id(params[:path][0]) || BookingRequest.new
      cms_page_path ["Content","Booking"], 
      @request.new_record? ? "Create a Request" : ["Edit %s",nil,@request.name]

      if request.post? && params[:request]
        if !params[:commit] 
          redirect_to :action => 'index'
        elsif @request.update_attributes(params[:request])
          flash[:notice] = 'Saved Request'
          redirect_to :action => 'index'
        end
      end
    end     
  end