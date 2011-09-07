Deface::Override.new(:virtual_path => 'wishlists/new',
                     :name => 'replace_new_wishlist_form',
                     :replace_contents => "code[erb-loud]:contains('form_for')",
                     :closing_selector => "code[erb-silent]:contains('end')",
                     :text => %q{<p><%= f.label :name, t(:name), :class => "inline" %>:&nbsp;<%= f.text_field :name %></p>
  <p><%= f.check_box :is_private %>&nbsp;<%= f.label :is_private, "Keep this list private, for my eyes only!", :class => "inline" %></p>
  <div class="submit">
    <button type="submit" class="blue">Create Wish List</button>
  </div>})
