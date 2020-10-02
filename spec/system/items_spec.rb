require 'rails_helper'

RSpec.describe '商品出品機能', type: :system do
  it 'ログインしていない状態で出品ページにアクセスした場合、サインインページに移動する' do
    # 出品ページに遷移する
    visit new_item_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
  end
end
