User.create!(
  email: 'admin@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  name: 'Admin User',
  roles: 'site_admin'
)

p '1 Admin user created'

User.create!(
  email: 'regular@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  name: 'Regular User'
)

p '1 regular user created'

3.times do |i|
  Topic.create!(
    title: "Topic Number #{i}"
  )
end

10.times do |i|
  Blog.create!(
    title: "My Blog Post Title #{i}",
    body: "My blog body content for blog #{i}",
    topic_id: Topic.last.id
  )
end

p '10 blog posts created'

5.times do |i|
  Skill.create!(
    title: "Rails skill #{i}",
    percent_utilized: i * 10
  )
end

p '5 skills created'

9.times do |i|
  Portfolio.create!(
    title: "Portfolio item #{i}",
    subtitle: 'Ruby on rails',
    body: 'This is the portfolio\'s description',
    main_image: 'http://via.placeholder.com/600x400',
    thumbnail_image: 'http://via.placeholder.com/350x200'
  )
end

1.times do |i|
  Portfolio.create!(
    title: "Portfolio item #{i}",
    subtitle: 'Angular',
    body: 'This is the portfolio\'s description',
    main_image: 'http://via.placeholder.com/600x400',
    thumbnail_image: 'http://via.placeholder.com/350x200'
  )
end
p '9 portfolio items created'

3.times do |i|
  Portfolio.last.technologies.create!(
    name: "Technology #{i}"
  )
end
p '3 technologies created'