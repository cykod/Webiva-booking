class Booking::PageRenderer < ParagraphRenderer

  features '/booking/page_feature'

  paragraph :list
  paragraph :view

  def list
    @options = paragraph_options :list

    # Any instance variables will be sent in the data hash to the 
    # booking_page_list_feature automatically

    render_paragraph :feature => :booking_page_list
  end

  def view         
    if !params[:request]
      @request = BookingRequest.new
    else
      @request = BookingRequest.find_by_id(params[:request][:id])
    end

    require_js('prototype')
    require_js('user_application')

    render_paragraph :partial => '/booking/page/view'
  end
end
