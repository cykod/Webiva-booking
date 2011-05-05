class Booking::PageController < ParagraphController

  editor_header 'Booking Paragraphs'
  
  editor_for :list, :name => "List", :feature => :booking_page_list
  editor_for :view, :name => "View", :feature => :booking_page_view

  class ListOptions < HashModel
    # Paragraph Options
    # attributes :success_page_id => nil

    options_form(
                 # fld(:success_page_id, :page_selector) # <attribute>, <form element>, <options>
                 )
  end

  class ViewOptions < HashModel
    # Paragraph Options
    # attributes :success_page_id => nil

    options_form(
                 # fld(:success_page_id, :page_selector) # <attribute>, <form element>, <options>
                 )
  end

end
