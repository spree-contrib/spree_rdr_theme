Deface::Override.new(:virtual_path => "spree/taxons/show",
                     :name => "replace_taxon_children",
                     :replace => "[data-hook='taxon_children']",
                     :text => %q{  <div data-hook="taxon_products">
    <%= render :partial => "spree/shared/products", :locals => {:products => @products, :taxon => @taxon } %>
  </div>})
