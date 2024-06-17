


require 'rails_helper'

RSpec.describe "Products", type: :system do
  describe "GET /products/:id" do
    it "renders product_path(id)" do
        book = FactoryBot.create(:book)
        visit product_path(book.id)
        click_link "購入"
        assert_text "#{book.title}"
        have_button '次へ'
      end
    end
  

  describe "POST /orders" do
    it "renders products_path" do
      book = FactoryBot.create(:book)
      visit product_path(book.id)
      click_link "購入"
      assert_text "#{book.title}"
      fill_in "order_count", with: 1
      fill_in "order_address", with: "大阪市"
      click_button '次へ'
      expect(current_path).to eq confirm_orders_path
      assert_text "#{book.title}"
      assert_text "1"
      assert_text "大阪市"
      click_button '注文を確定する'
      expect(current_path).to eq  complete_orders_path
      assert_text "注文が完了しました。"
    end
  end
end