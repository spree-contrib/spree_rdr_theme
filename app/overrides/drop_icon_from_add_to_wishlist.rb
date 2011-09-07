Deface::Override.new(:virtual_path => 'products/show',
                     :name => 'drop_icon_from_add_to_wishlist',
                     :replace => "code[erb-loud]:contains('icons/add-to-cart')",
                     :text => %q{<%= t('add_to_wishlist') %>},
                     :sequence => {:after => 'add_wish_to_cart_form'})
