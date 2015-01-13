require('sinatra')
require('sinatra-contrib')
also_reload("lib/**/*.rb")
require('./lib/task')


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
