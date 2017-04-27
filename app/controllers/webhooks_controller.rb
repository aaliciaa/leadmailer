class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def postmark
    puts "you made it to the webhook"
    # lead_name = params[:FromName]
    # lead_email = params[:From]
    # lead_phone = params[:From]
    # lead_source = params[:From]
    lead_html = params[:HtmlBody]
    puts lead_html

    # page = Nokogiri::HTML(lead_html)
    # lead_name = page.css('.lm-name')[0].text
    # lead_email = page.css('.lm-email')[0].text
    # lead_phone = page.css('.lm-phone')[0].text
    # lead_source = ["Car Kijiji", "Truck Sales"].sample
    # create_lead_from_email(
    #   name: lead_name,
    #   email: lead_email,
    #   phone: lead_phone,
    #   source: lead_source,
    #   html: lead_html
    # )
  end

  private

  def create_lead_from_email(attributes)
    CreateLeadFromEmailService.new(attributes).create
  end
end




# File.open("body.txt", "a") do |line|
#   line.puts params[:HtmlBody]
# end
