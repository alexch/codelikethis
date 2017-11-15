# class BootstrapSampleTemplate < Erector::Widget
#   def content
#     rawtext '<!doctype html>'
#     html :lang => 'en' do
#       head do
#         meta :charset => 'utf-8' do
#           meta :name => 'viewport', :content => 'width=device-width, initial-scale=1, shrink-to-fit=no' do
#             meta :name => 'description', :content => '' do
#               meta :name => 'author', :content => '' do
#                 link :rel => 'icon', :href => '../../../../favicon.ico' do
#                   title do
#                     text 'Starter Template for Bootstrap'
#                   end
#                   rawtext '<!-- Bootstrap core CSS -->'
#                   link :href => '../../../../dist/css/bootstrap.min.css', :rel => 'stylesheet' do
#                     rawtext '<!-- Custom styles for this template -->'
#                     link :href => 'starter-template.css', :rel => 'stylesheet' do
#                     end
#                     body do
#                       nav :class => 'navbar navbar-expand-md navbar-dark bg-dark fixed-top' do
#                         a :class => 'navbar-brand', :href => '#' do
#                           text 'Navbar'
#                         end
#                         button :class => 'navbar-toggler', :type => 'button', 'data-toggle' => 'collapse', 'data-target' => '#navbarsExampleDefault', 'aria-controls' => 'navbarsExampleDefault', 'aria-expanded' => 'false', 'aria-label' => 'Toggle navigation' do
#                           span :class => 'navbar-toggler-icon' do
#                           end
#                         end
#                         div :class => 'collapse navbar-collapse', :id => 'navbarsExampleDefault' do
#                           ul :class => 'navbar-nav mr-auto' do
#                             li :class => 'nav-item active' do
#                               a :class => 'nav-link', :href => '#' do
#                                 text 'Home'
#                                 span :class => 'sr-only' do
#                                   text '(current)'
#                                 end
#                               end
#                             end
#                             li :class => 'nav-item' do
#                               a :class => 'nav-link', :href => '#' do
#                                 text 'Link'
#                               end
#                             end
#                             li :class => 'nav-item' do
#                               a :class => 'nav-link disabled', :href => '#' do
#                                 text 'Disabled'
#                               end
#                             end
#                             li :class => 'nav-item dropdown' do
#                               a :class => 'nav-link dropdown-toggle', :href => 'http://example.com', :id => 'dropdown01', 'data-toggle' => 'dropdown', 'aria-haspopup' => 'true', 'aria-expanded' => 'false' do
#                                 text 'Dropdown'
#                               end
#                               div :class => 'dropdown-menu', 'aria-labelledby' => 'dropdown01' do
#                                 a :class => 'dropdown-item', :href => '#' do
#                                   text 'Action'
#                                 end
#                                 a :class => 'dropdown-item', :href => '#' do
#                                   text 'Another action'
#                                 end
#                                 a :class => 'dropdown-item', :href => '#' do
#                                   text 'Something else here'
#                                 end
#                               end
#                             end
#                           end
#                           form :class => 'form-inline my-2 my-lg-0' do
#                             input :class => 'form-control mr-sm-2', :type => 'text', :placeholder => 'Search', 'aria-label' => 'Search' do
#                               button :class => 'btn btn-outline-success my-2 my-sm-0', :type => 'submit' do
#                                 text 'Search'
#                               end
#                             end
#                           end
#                         end
#                         main :role => 'main', :class => 'container' do
#                           div :class => 'starter-template' do
#                             h1 do
#                               text 'Bootstrap starter template'
#                             end
#                             p :class => 'lead' do
#                               text 'Use this document as a way to quickly start any new project.'
#                               br do
#                                 text 'All you get is this text and a mostly barebones HTML document.'
#                               end
#                             end
#                           end
#                           rawtext '<!-- /.container -->'
#                           rawtext '<!-- Bootstrap core JavaScript
# ================================================== -->'
#                           rawtext '<!-- Placed at the end of the document so the pages load faster -->'
#                           script :src => 'https://code.jquery.com/jquery-3.2.1.slim.min.js', :integrity => 'sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN', :crossorigin => 'anonymous' do
#                           end
#                           script do
#                             text 'window.jQuery || document.write(\''
#                             script :src => '../../../../assets/js/vendor/jquery.min.js' do
#                               text '<\/script>\')'
#                             end
#                             script :src => '../../../../assets/js/vendor/popper.min.js' do
#                             end
#                             script :src => '../../../../dist/js/bootstrap.min.js' do
#                             end
#                           end
#                         end
#   end
# end
