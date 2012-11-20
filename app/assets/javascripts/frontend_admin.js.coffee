//= require ckeditor/init_ckeditor
//= require frontend_editor/frontend_editor

#Send the csrf token before an ajax send for rails
$.ajaxSetup
  beforeSend: (xhr, settings) ->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    return if settings.crossDomain
    return if settings.type == "GET"
    if csrf_token
      xhr.setRequestHeader('X-CSRF-Token', csrf_token)

#Init the backbone application when jQuery is ready
$(document).ready ->
  FrontendEditor.init()
