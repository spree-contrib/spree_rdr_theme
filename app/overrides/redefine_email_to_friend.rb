if Rails.application.railties.all.map(&:railtie_name).include? "spree_email_to_friend"

  Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "converted_product_description_351026984",
                     :disabled => true)

  Deface::Override.new(:virtual_path => "spree/products/show",
                       :name => "add_email_to_friend_under_add_to_cart_button",
                       :insert_before => '[data-hook="product_description"]',
                       :text => "<p class=\"email_to_friend\"><%= link_to t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product), :class => 'button' %></p>",
                       :squence => {:after => 'converted_product_description_351026984'})

end
