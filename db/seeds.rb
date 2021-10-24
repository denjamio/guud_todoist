user = User.find_or_create_by(email: "denjamio@gmail.com")

6.times do |i|
  user.tags.find_or_create_by(name: "etiqueta #{i}")
end

10.times do |i|
  task = user.tasks.find_or_create_by(title: "tarea #{i}", deadline: Date.today)
  task.tags << Tag.order("random()").take
end