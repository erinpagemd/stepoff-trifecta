Fabricator(:track) do
  name     {Faker::Name.name}
  distance {Random.rand(10.0).round(1)}
  outdoor  {[true, false].sample}
end
