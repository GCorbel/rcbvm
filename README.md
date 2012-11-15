## What is this project

This project is just a simple website about the RCBVM (Regroupement Citoyen de la Base de Villégiature de Moisie). This is not very interesting for developpers.

## Why it could be intersant for a developper?

In this project, I integreted a front-end editor to RefineryCMS. I use aloha-editor for the wysiwyg but I think it's easy to change it. It's also easy to use it with a standard rails application or other gems or CMS.

## How it works

This is simple rails and backbone code.

The first think to do is to add the gems in the Gemfile like there :

  gem 'aloha-rails'
  gem 'backbone-on-rails'

After, you must to bundle and generate every generator like this :

  rails generate aloha:install
  rails generate backbone:install

The real work start, the main js files are here :

  - [/app/assets/javascripts/aloha-config.coffee](https://github.com/GCorbel/rcbvm/blob/master/app/assets/javascripts/aloha-config.coffee) (at the end)
  - [/app/assets/javascripts/rcbvm.js.coffee](https://github.com/GCorbel/rcbvm/blob/master/app/assets/javascripts/rcbvm.js.coffee)
  - [/app/assets/javascripts/views/toolbar_view.js.coffee](https://github.com/GCorbel/rcbvm/blob/master/app/assets/javascripts/views/toolbar_view.js.coffee)
  - [/app/assets/javascripts/models/item.js.coffee](https://github.com/GCorbel/rcbvm/blob/master/app/assets/javascripts/models/item.js.coffee)

And there is a template file (in french, sorry) here :

  - [/app/assets/templates/toolbar_views.jst.eco.erb](https://github.com/GCorbel/rcbvm/blob/master/app/assets/templates/toolbar_views.jst.eco.erb)

You can read the comments, I think it's clear.

To load all files, In the layout, I added this :

  <% unless admin? # all required JS included by backend. %>
    <%= stylesheet_link_tag 'admin', 'aloha/css/aloha' %>
    <% content_for :javascripts do %>
      <script data-aloha-plugins="common/table, common/highlighteditables, common/format,common/list,common/link,common/block,common/undo,common/contenthandler,common/paste" src="/assets/aloha/lib/aloha.js" type="text/javascript"></script>
      <%= javascript_include_tag 'admin' %>
    <% end %>
  <% end -%>

Obiviously, I added the needed javascripts and stylesheets file in application.js and application.css.

Ok, now in the views, for pages, here : [/master/app/views/refinery/pages](https://github.com/GCorbel/rcbvm/tree/master/app/views/refinery/pages), I added this :

  <div class="editable-long-text" data-object="pages" data-id="<%= @page.id %>" data-attribute="body">
    <%= raw @page.content_for(:body) %>
  </div>

When the editor is in edit mode, this part, with class "editable-long-text" is tranformed to be a text editor. It's linked with a item whick like to the pages controller. The id is @page.id. Finally, the modified part is "body".

For the news, I did the same think. Like this :

  <div class="editable-long-text" data-object="news" data-id="<%= @item.id %>" data-attribute="body">
    <%= raw @item.body %>
  </div>

Now, when I edit my text and I click on the save button, it send an ajax request. To trigger this call, I added the path in my route and I did two simple controllers :

  [/app/controllers](https://github.com/GCorbel/rcbvm/tree/master/app/controllers)

And... It works!

## Problems known

This tool is probably to simple. I think it's better to create and edit a page with the backend and to correct mistake with the frond-end.

There is a problem with the HTML generated. I have uggly code like `<br class="aloha-end-br">`. This is a problem with aloha. I didn't find the solution for the moment.

I probably should create a gem for this but I don't know what is the best way. If you have some ideas, please contact me.

## Conclusion

If you want to use the code and to improve it. Please let me know.
