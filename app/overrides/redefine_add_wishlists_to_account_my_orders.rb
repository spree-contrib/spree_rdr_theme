if Rails.application.railties.all.map(&:railtie_name).include? "spree_wishlist"

  Deface::Override.new(:virtual_path => "users/show",
                       :name => "add_wishlists_to_account_my_orders",
                       :text => %q{<h3>
  My Wishlists:
  <% if current_user.wishlists.present? %>
    <%= raw current_user.wishlists.map { |wl| link_to(wl.name, wl) }.join(", ") %>,&nbsp;
  <% end %>
  <%= link_to "Create New Wish List", new_wishlist_url %>
</h3>})

end
