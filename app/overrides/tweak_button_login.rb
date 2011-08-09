Deface::Override.new(:virtual_path => %q{shared/_login},
                     :name => %q{tweak_button_login},
                     :replace => %q{p code:contains('submit_tag')},
                     :text => %q{<button type="submit">Log In</button>})

