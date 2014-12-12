class WebpurifyApi::Image < WebpurifyApi::Base
  def initialize(api_key: nil, live: nil)
    super(api_key: api_key, live: live, endpoint: "https://im-api1.webpurify.com/services/rest/")
  end
  
  # callback url receive a get request  with +imgid+ and +status+ parameters
  # status: 1 = approved , status: 2 = declined
  def check(url, custom_image_id: nil, callback: nil)
    res = do_request(:imgcheck, params: { imgurl: url, customimgid: custom_image_id, callback: callback })
    res
  end

  def status(image_id)
    do_request(:imgstatus, params: { imgid: image_id })
  end

  def account
    do_request(:imgaccount)
  end
end
