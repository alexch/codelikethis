require "track"

class Track
  JavascriptIntro = Track.new(
      name: "javascript_intro",
      display_name: "JavaScript After Hours",
      description: "Learn the basics of JavaScript and Web scripting",
      ) do
      
      lesson name: "terminal_basics"
      lesson name: "types_intro"
      lesson name: "/javascript/stacks"
      lesson name: "empty_values"
      lesson name: "common_operators"
      lesson name: "/javascript/functions"
      lesson name: "arguments"
      lesson name: "input_output",
        display_name: "I/O"
      lesson name: "functional_labs"
      lesson name: "/javascript/scope"
      lesson name: "/javascript/logic"
      lesson name: "/javascript/arrays"
      lesson name: "hello_frenemy"
      lesson name: "/javascript/loops"
      lesson name: "/git/git_intro"
      lesson name: "/javascript/iteration_methods"
      lesson name: "/javascript/objects"
      lesson name: "object_methods"
      lesson name: "/oo/oo_js"
      lesson name: "methods_and_classes"
      lesson name: "simple_http"
      lesson name: "/www/html"
      lesson name: "/www/urls"
      lesson name: "/www/dom_debugging"
      lesson name: "hello_frenemy_www"
      lesson name: "/www/dom_scripting"
      lesson name: "event_listeners"
      lesson name: "express_intro_and_server_basics"
      lesson name: "deploy_tic_tac_toe"
      lesson name: "/server_side_javascript/routing"
      lesson name: "/www/css"
      lesson name: "/responsive_layout/css_layout"
      lesson name: "/responsive_layout/flexbox_layout"
      lesson name: "/responsive_layout/css_grid"
      lesson name: "whats_next"
      lesson name: "common_methods"
      lesson name: "/javascript/recursion"
      lesson name: "asynchronous_js"
      lesson name: "/javascript/debugging_techniques"
      lesson name: "/javascript/unit_testing"
      end
    end