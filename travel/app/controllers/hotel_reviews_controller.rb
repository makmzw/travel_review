class HotelReviewsController < ApplicationController

  # ホテル情報の表示
  # and レビュー一覧の表示
  # and レビュー登録
  def index
    
    url = 'http://jws.jalan.net/APILite/HotelSearch/V1/'

    search_params = {
      key: ENV['JARAN_APPLICATION_ID'], # APIキー
      h_id: params[:code],
      count: 100,
    }

    conn = Faraday.new(url: url)
    response = conn.get '', search_params
    response_hash = Hash.from_xml(response.body)['Results']['Hotel']

    if !Hotel.where(code: response_hash['HotelID']).exists?
      @hotel = Hotel.new(
        code: response_hash['HotelID'],
        name: response_hash['HotelName'],
        postcode: response_hash['PostCode'],
        address: response_hash['HotelAddress'],
        ).save
    else
      @hotel = Hotel.where(code: response_hash['HotelID'])
    end

  end

end