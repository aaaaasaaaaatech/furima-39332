class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @items = Item.all
    charge_id_names= { 2 => '着払い(購入者負担)', 3 => '送料込み(出品者負担)' } 
    @charge_id_names = charge_id_names
    # @sold_out_items = calculate_sold_out_items(@items)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    category_id_names = { 2 => 'メンズ', 3 => 'レディース', 4 => 'ベビー・キッズ', 5 => 'インテリア・住まい・小物', 6 => '本・音楽・ゲーム', 7 => 'おもちゃ・ホビー・グッズ', 8 => '家電・スマホ・カメラ', 9 => 'スポーツ・レジャー', 10 => 'ハンドメイド', 11 => 'その他' }
    @category_id_names = category_id_names
    condition_id_names = { 2 => '新品・未使用', 3 => '未使用に近い', 4 => '目立った傷や汚れなし', 5 => 'やや傷や汚れあり', 6 => '傷や汚れあり', 7 => '全体的に状態が悪い' }
    @condition_id_names = condition_id_names
    area_id_names = { 'id:' => 'name:', 2 => '北海道', 3 => '青森県', 4 => '岩手県', 5 => '宮城県', 6 => '秋田県', 7 => '山形県', 8 => '福島県', 9 => '茨城県', 10 => '栃木県', 11 => '群馬県', 12 => '埼玉県', 13 => '千葉県', 14 => '東京都', 15 => '神奈川県', 16 => '新潟県', 17 => '富山県', 18 => '石川県', 19 => '福井県', 20 => '山梨県', 21 => '長野県', 22 => '岐阜県', 23 => '静岡県', 24 => '愛知県', 25 => '三重県', 26 => '滋賀県', 27 => '京都府', 28 => '大阪府', 29 => '兵庫県', 30 => '奈良県', 31 => '和歌山県', 32 => '鳥取県', 33 => '島根県', 34 => '岡山県', 35 => '広島県', 36 => '山口県', 37 => '徳島県', 38 => '香川県', 39 => '愛媛県', 40 => '高知県', 41 => '福岡県', 42 => '佐賀県', 43 => '長崎県', 44 => '熊本県', 45 => '大分県', 46 => '宮崎県', 47 => '鹿児島県', 48 => '沖縄県' }
    @area_id_names = area_id_names
    shippingday_id_names = {'id' => 'name', 2 => '1〜2日で発送', 3 => '2〜3日で発送', 4 => '4〜7日で発送'}
    @shippingday_id_names =shippingday_id_names
    @username = @item.user.nickname
  end


  def move_to_new
    if user_signed_in?
      redirect_to user_session_path
    else
      redirect_to new_item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  # def calculate_sold_out_items(items)
  #   items.select { |item| item.sold_out? }
  # end
end
