module AdvertiserHelper
  def advertiser_icon(advertiser)
    (advertiser.user?) ? 'glyphicon-user' : 'glyphicon-briefcase'
  end

  def advertiser_document(advertiser)
    document = advertiser.document

    if advertiser.user?
      document.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
    elsif advertiser.company?
      document.gsub(/\A(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})\Z/, "\\1.\\2.\\3/\\4-\\5")
    else
      document
    end
  end
end
