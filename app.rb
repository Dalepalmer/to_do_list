require('sinatra')
require('sinatra-contrib')
also_reload("lib/**/*.rb")
require('./lib/task')
require("./lib.list")
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks")
  description = parms.fetch("description")
  task = Task.new(description)
  task.save()
  erb(:success)
end


post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:index)
end
