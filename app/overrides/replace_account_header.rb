Deface::Override.new(:virtual_path => %q{spree/users/show},
                          :name => %q{replace_account_header},
                          :replace => %q{h3:contains('accurate_title')},
                          :text => %q{<h1><%= t("my_account") %><%= link_to "(edit)", edit_account_path, :id => "edit_account_link" %></h1>})
