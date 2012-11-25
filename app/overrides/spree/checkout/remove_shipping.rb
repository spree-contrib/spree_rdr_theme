Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                     :name => %q{remove_shipping},
                     :remove => %q{#shipping[data-hook]})
