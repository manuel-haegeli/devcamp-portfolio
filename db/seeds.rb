10.times do |i|
  Blog.create!(
    title: "My Blog Post Title #{i}",
    body: "My blog body content for blog #{i}"
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
    subtitle: "With subtitle #{i}",
    body: 'This is the portfolio\'s description',
    main_image: 'http://via.placeholder.com/600x400',
    thumbnail_image: 'http://via.placeholder.com/350x200'
  )
end
p '9 portfolio items created'