keywords = %w(rose lily begonia sunflower violets)

description = [
  'A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over a hundred species and thousands of cultivars. They form a group of plants that can be erect shrubs, climbing or trailing with stems that are often armed with sharp prickles.',
  'Narcissus were well known in ancient civilisation, both medicinally and botanically, but formally described by Linnaeus in his Species Plantarum (1753). The genus is generally considered to have about ten sections with approximately 50 species.',
  'The Orchidaceae are a diverse and widespread family of flowering plants, with blooms that are often colourful and often fragrant, commonly known as the orchid family.',
  'Sunflowers are usually tall annual or perennial plants that grow to a height of 300 centimetres (120 in) or more. They bear one or more wide, terminal capitula (flower heads), with bright yellow ray florets at the outside and yellow or maroon (also known as a brown/red) disc florets inside.',
  'Lilium (members of which are true lilies) is a genus of herbaceous flowering plants growing from bulbs, all with large prominent flowers. Lilies are a group of flowering plants which are important in culture and literature in much of the world. Most species are native to the temperate northern hemisphere, though their range extends into the northern subtropics. Many other plants have "lily" in their common name but are not related to true lilies.',
  'Nelumbo nucifera, also known as Indian lotus, sacred lotus, bean of India, Egyptian bean or simply lotus, is one of two extant species of aquatic plant in the family Nelumbonaceae. The Linnaean binomial Nelumbo nucifera (Gaertn.)'
]

(1..10).each do |i|
  Post.new(
    title: keywords.sample.capitalize,
    description: description.sample,
    author: "user_#{i}",
    likes: rand(1...10),
    image: "flower#{i}.jpg"
  ).save(validate: false)
end
