class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def postmark
    lead_name = params[:FromName]
    lead_email = params[:From]
    lead_phone = "905-681-1947"
    lead_source = ["Car Kijiji", "Truck Sales"].sample
    lead_html = params[:HtmlBody]

    create_lead_from_email(
      name: lead_name,
      email: lead_email,
      phone: lead_phone,
      source: lead_source,
      html: lead_html
    )
  end

  private

  def create_lead_from_email(attributes)
    CreateLeadFromEmailService.new(attributes).create
  end
end




# File.open("body.txt", "a") do |line|
#   line.puts params[:HtmlBody]
# end


# page = Nokogiri::HTML(lead_html)
# lead_name = page.css('#lm-name')
# lead_name2 = page.css('#lm-name').text
# lead_name = page.css('.lm-name')[0].text
# lead_email = page.css('.lm-email')[0].text
# lead_phone = page.css('.lm-phone')[0].text
# lead_source = ["Car Kijiji", "Truck Sales"].sample
