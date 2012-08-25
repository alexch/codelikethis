require 'erector'

# Emit the HTML/JS code for a Disqus comment thread.
# `shortname` is required; other JS variables (see http://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables )
# are optional. Note that for this widget, omit the `disqus_` prefix, e.g.
# `widget Disqus, shortname: "mysite", identifier: "lolthread"`
#
class Disqus < Erector::Widget

  needs :shortname   # required

  # see http://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables
  VARIABLES = [:shortname, :developer, :identifier, :url, :title, :category_id]
  VARIABLES.each do |variable|
    needs variable => nil;
  end

  def variables
    VARIABLES.map do |variable|
      value = instance_variable_get(:"@#{variable}")
      "var disqus_#{variable} = #{value.inspect};" if value
    end.compact.join("\n")
  end

  def content
    html = <<-HTML
<div id="disqus_thread"></div>
<script type="text/javascript">
    #{variables}

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    HTML

    rawtext html

  end
end
