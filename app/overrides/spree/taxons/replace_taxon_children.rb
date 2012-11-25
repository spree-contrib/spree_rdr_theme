Deface::Override.new(:virtual_path => %q{spree/taxons/show},
                     :name => %q{replace_taxon_children},
                     :replace => %q{[data-hook='taxon_children']},
                     :text => %q{<div data-hook="taxon_products">
    <%= render :partial => "spree/shared/products", :locals => {:products => @products, :taxon => @taxon } %>
  </div>})
