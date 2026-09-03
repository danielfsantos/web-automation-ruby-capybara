class InventoryPage < SitePrism::Page
  element :page_title, '.title'
  element :cart_badge, '.shopping_cart_badge'
  elements :inventory_items, '.inventory_item'

  def add_product_to_cart(product_name)
    item = inventory_items.find { |el| el.text.include?(product_name) }
    item.find('button', text: 'Add to cart').click
  end
end
