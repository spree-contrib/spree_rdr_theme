Deface::Override.new(:virtual_path => %q{orders/edit},
                          :name => %q{replace_empty-cart},
                          :replace => %q{#empty-cart[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div data-hook="cart_buttons">
    <p id="cart-count"><%= t("your_cart_is_empty.") %></p>
    <p><%=link_to t("continue_shopping"), products_path, :class => 'button continue' %></p>
  </div>},
                          :disabled => false)
