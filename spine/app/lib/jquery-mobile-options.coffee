# Source: https://github.com/lagartoflojo/spine.jqmobile
# Base controller designed to be used with a Spine.Manager.
# Overrides activate() so that calling active() on the controller
# will automatically show it, using jQM's changePage function.
# jQuery Mobile automatically adds the .ui-page-active class
# on the active page, so it's not necessary to add the .active class,
# so we override deactivate() to do nothing and isActive to check
# for the .ui-page-active class.
# Binds the jqm:updatelayout event so that controllers that inherit
# from this class can trigger it and make jQuery Mobile re-style
# the entire page (for example, after dynamically injecting HTML).

class Spine.JQMobileController extends Spine.Controller
  tag: 'section'

  constructor: ->
    super
    @bind 'jqm:updatelayout', @_jqmUpdateLayout
    @el.attr("data-role", 'page')
    #@el.attr("data-#{$.mobile.ns}role", 'page')

  activate: ->
    $.mobile.changePage(@el)
    @

  deactivate: ->
    @

  isActive: ->
    @el.hasClass($.mobile.activePageClass)

  _jqmUpdateLayout: =>
    #@el.page('destroy').trigger( "create" )

  pageId: (el_id) ->
    @el.attr('id', el_id)