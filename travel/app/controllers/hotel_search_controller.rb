class HotelSearchController < ApplicationController

  def index
  end

  def results
    url = 'http://jws.jalan.net/APILite/HotelSearch/V1/'

    # 検索条件はフォームから取得して、動的に変えられるようにしましょう
    search_params = {
      key: ENV['JARAN_APPLICATION_ID'], # APIキー
      pref: params[:prefectures],
      count: 100,
    }

    conn = Faraday.new(url: url)
    response = conn.get '', search_params
    @hotels = Hash.from_xml(response.body)['Results']['Hotel']
  end

end