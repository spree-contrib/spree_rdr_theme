Deface::Override.new(:virtual_path => %q{spree/products/show},
                     :name => %q{add_taxonomies_to_product_show},
                     :insert_after => %q{[data-hook='product_show']},
                     :sequence => {:after => 'add_recently_viewed_products_to_products_show'},
                     :text => %q{<%= content_for :sidebar do %>
  <%= render 'shared/all_products' %>
<% end %>})
