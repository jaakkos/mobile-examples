class App.WorkLog extends Batman.Model
  @encode 'description', 'customer', 'started_at', 'ended_at', 'created_at'
  @persist Batman.LocalStorage