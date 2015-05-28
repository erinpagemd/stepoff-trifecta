Fabricator(:track) do
  name     {Faker::Name.name}
  distance 9.99
  outdoor  {[true, false].sample}
end
