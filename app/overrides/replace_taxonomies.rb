Deface::Override.new(:virtual_path => %q{shared/_taxonomies},
                          :name => %q{replace_taxonomies},
                          :replace => %q{#taxonomies[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div id="all-products" class="list-box">
  <% if @taxon.present? && @taxon.children.present? %>
    <h2>More Products</h2>
    <ul>
      <% @taxon.children.each_with_index do |taxon,i| %>
        <li><%= raw link_to(taxon.name, seo_url(taxon)) %></li>
      <% end %>
    </ul>
  <% end %>
    <h2>All Products</h2>
    <ul>
      <% Taxonomy.where(:name => "Categories").first.root.children.each_with_index do |taxon,i| %>
        <li><%= raw link_to(taxon.name, seo_url(taxon)) %></li>
    <% end %>
    </ul>
</div>},
                          :disabled => false,
                          :sequence => 100)

