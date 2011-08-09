Deface::Override.new(:virtual_path => %q{layouts/spree_application},
                          :name => %q{replace_wrapper},
                          :replace => %q{#wrapper[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div id="main" role="main">
  <% if flash.notice %>
    <div class="flash notice"><%= flash.notice %></div>
  <% end %>
  <% if flash[:error] %>
    <div class="flash errors"><%= flash[:error] %></div>
  <% end %>

  <%= yield %>
</div>

<% if content_for?(:sidebar) %>
  <div id="sidebar" role="sidebar" data-hook>
    <%= yield :sidebar %>
  </div>
<% end %>},
                          :disabled => true,
                          :sequence => 100)

