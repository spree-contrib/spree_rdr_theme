Deface::Override.new(:virtual_path => %q{checkout/_summary},
                     :name => %q{remove_summary_title},
                     :remove => %q{h3},
                     :sequence => {:before => 'replace_order_summary'})
