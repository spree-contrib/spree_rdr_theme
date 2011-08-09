Deface::Override.new(:virtual_path => %q{checkout/payment/_gateway},
                          :name => %q{remove_card_expiration},
                          :remove => %q{[data-hook='card_expiration']})
