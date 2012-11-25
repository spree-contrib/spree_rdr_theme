Deface::Override.new(:virtual_path => %q{spree/taxons/show},
                          :name => %q{replace_taxon_sidebar_navigation},
                          :replace => %q{[data-hook='taxon_sidebar_navigation']},
                          :closing_selector => %q{},
                          :text => %q{<div data-hook="taxon_sidebar_navigation">
    <%= render :partial => "spree/shared/taxonomies" %></div>
</div>})
