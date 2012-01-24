(function() {
  var App;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  App = (function() {

    __extends(App, Batman.App);

    function App() {
      App.__super__.constructor.apply(this, arguments);
      $('body').bind('click', function(event) {
        console.log(event);
        return event.preventDefault();
      });
    }

    App.global(true);

    App.controller('worklogs');

    App.route('worklogs/:id', 'worklogs#show');

    App.model('work_log');

    App.root('worklogs#index');

    return App;

  })();

}).call(this);
