if Rails.application.railties.all.map(&:railtie_name).include? "spree_related_products"

  Deface::Override.new(:virtual_path => %q{products/show},
                       :name => %q{add_related_products_to_cart_form},
                       :replace => %q{[data-hook='cart_form'] hr},
                       :sequence => {:after => "replace_cart_form" },
                       :text => %q{<% if @product.cross_sells.present? %>
  <div class="extras">
    <% @product.cross_sells.each do |cross_sell| %>
    <p>
      <%= check_box_tag "variants[#{cross_sell.master.id}]", 1 %>
      <label for="">
        Add <em>'<%= link_to cross_sell.name, product_url(cross_sell) %>'</em> for <%= product_price(cross_sell) %>
      </label>
    </p>
    <% end %>
  </div>
<% end %>})

end
