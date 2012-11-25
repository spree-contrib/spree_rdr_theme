Deface::Override.new(:virtual_path => %q{spree/users/show},
                     :name => %q{remove_account_summary},
                     :remove => %q{[data-hook='account_summary']})
