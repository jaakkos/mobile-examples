(function() {
  var App;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  App = (function() {

    __extends(App, Batman.App);

    function App() {
      App.__super__.constructor.apply(this, arguments);
    }

    App.on('run', function() {});

    App.on('ready', function() {
      return console.log("Classifieds ready for use.");
    });

    App.global(true);

    App.controller('logs');

    App.root('logs#index');

    App.resources('logs');

    App.model('log');

    App.flash = Batman();

    App.flash.accessor({
      get: function(k) {
        return this[k];
      },
      set: function(k, v) {
        var _this = this;
        this[k] = v;
        if (v !== '') {
          setTimeout(function() {
            return _this.set(k, '');
          }, 2000);
        }
        return v;
      }
    });

    App.flashSuccess = function(message) {
      return this.set('flash.success', message);
    };

    App.flashError = function(message) {
      return this.set('flash.error', message);
    };

    return App;

  })();

}).call(this);
