Deface::Override.new(:virtual_path => %q{spree/taxons/show},
                     :name => %q{replace_taxon_children},
                     :remove => %q{[data-hook='taxon_children']})
