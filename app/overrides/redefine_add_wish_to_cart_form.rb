if Rails.application.railties.all.map(&:railtie_name).include? "spree_wishlist"

  Deface::Override.new(:virtual_path => 'products/show',
                       :name => 'add_wish_to_cart_form',
                       :sequence => {:after => 'replace_product_show'})

end
