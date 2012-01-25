class App.Log extends Batman.Model
  @encode 'id', 'description', 'customer', 'started_at', 'ended_at', 'created_at'
  @persist Batman.LocalStorage