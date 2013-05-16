Deface::Override.new(:virtual_path => %q{spree/layouts/spree_application},
                          :name => %q{replace_body},
                          :replace => %q{[data-hook='body']},
                          :closing_selector => %q{},
                          :text => %q{<body id="<%= (@body_id == 'signup' ? 'checkout' : @body_id) || controller.controller_name %>">
    <div id="container">
        <header>
          <%= link_to image_tag("store/logo.png", :width => "300", :height => "58", :alt => "Rails Dog Radio", :id => "logo"), root_url %>
          <form action="#" >
          </form>
          <%= form_tag products_url, :method => :get do %>
            <input type="search" id="s1" class="empty" name="keywords" placeholder="Search Railsdog Radio">
          <% end %>
          <nav>
            <%= link_to "products", products_path %>
            <% if current_spree_user %>
              <%= link_to t('my_account'), account_path, :class => "cart" %>
              <%= link_to t('logout'), destroy_user_session_path, :class => "cart" %>
            <% else %>
              <%= link_to t('log_in'), login_path, :class => "cart" %>
            <% end %>
            <%= link_to_cart %>
          </nav>
        </header>
        
        <% if content_for?(:banner) %>
          <div id="banner" role="banner">
            <%= yield :banner %>
          </div>
        <% end %>
        
        <div id="main" role="main">
          <% if flash.notice %>
            <div class="flash notice"><%= flash.notice %></div>
          <% end %>
          <% if flash[:error] %>
            <div class="flash errors"><%= flash[:error] %></div>
          <% end %>
        
          <%= yield %>
        </div>
        
        <% if content_for?(:sidebar) %>
          <div id="sidebar" role="sidebar">
            <%= yield :sidebar %>
          </div>
        <% end %>
        
    </div>
    
    <footer data-hook="footer">
      <div class="inner">
        <%= image_tag "store/kid.jpg", :width => "204", :height => "413", :alt => "RailsDog Radio Kid", :id => "kid" %>
    
        <div id="about-railsdog-radio">
          <div>
            <p>
              <strong>Railsdog Radio</strong> is NOT a real satellite radio store, it's a fully working demo application
              for <a href="http://www.spreecommerce.com">Spree Commerce</a>. Please feel free to play around, but don't submit any information you would not consider public!</p>
            <p id="more-about-railsdog-radio">
              <a href="/about">More about Railsdog Radio ></a>
            </p>
          </div>
        </div>
    
        <div id="contact-us">
          <h3>Contact Us</h3>
          <p>
          (301)560-2000<br>
          <a href="mailto:sales@railsdogradio.com">sales@railsdogradio.com</a>
          </p>
        </div>
    
        <div id="social">
          <h3>Social</h3>
          <p>
          <a href="http://facebook.com/spreecommerce" id="facebook"><span>Facebook</span></a>
          <a href="http://feeds2.feedburner.com/spreehq" id="rss"><span>RSS</span></a>
          <a href="http://twitter.com/spreecommerce" id="twitter"><span>Twitter</span></a>
          </p>
        </div>
    
        <div id="menu">
          <h3>Menu</h3>
          <p>
          <a href="/about">About us</a><br />
          <a href="/privacy">Privacy policy</a>
          </p>
        </div>
    
        <p id="copyright">&copy; Copyright <%= Time.zone.now.year %> Railsdog Radio. All rights reserved</p>
    
      </div>
    </footer>
</body>})
