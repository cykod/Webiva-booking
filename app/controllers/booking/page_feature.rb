class Booking::PageFeature < ParagraphFeature

  feature :booking_page_list, :default_feature => <<-FEATURE
    List Feature Code...
  FEATURE

  def booking_page_list_feature(data)
    webiva_feature(:booking_page_list,data) do |c|
      # c.define_tag ...
    end
  end

  feature :booking_page_view, :default_feature => <<-FEATURE
    New Booking Feature!!
  FEATURE

  def booking_page_view_feature(data)
    webiva_feature(:booking_page_view,data) do |c|
      # c.define_tag ...
    end
  end

end
