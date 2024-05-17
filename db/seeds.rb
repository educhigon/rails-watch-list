# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

m1 = {title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9}
m2 = {title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7}
m3 = {title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9}
m4 = {title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0}
l1 = {name: "Terror", photo: "https://static8.depositphotos.com/1550726/1010/i/450/depositphotos_10104616-stock-photo-man-walking-on-a-path.jpg"}
l2 = {name: "Comedy", photo: "https://www.theactorspulse.com.au/wp-content/uploads/2023/08/feature-img-2.png"}
l3 = {name: "Thriller", photo: "https://s3.amazonaws.com/static.rogerebert.com/uploads/review/primary_image/reviews/thriller-2019/Thriller6.jpg"}

[m1, m2, m3, m4].each do |im|
  # img = Cloudinary::Uploader.upload('https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg')
  img = Cloudinary::Uploader.upload(im[:poster_url])
  file = URI.open(img['url'])
  mov = Movie.create!(
      title: im[:title],
      overview: im[:overview],
      rating: im[:rating]
      )
  mov.poster_url.attach(io: file, filename: img['url'], content_type: "image/png")
end

[l1, l2, l3].each do |im|
  file = URI.open(im[:photo])
  lis = List.new(
    name: im[:name],
  )
  lis.photo.attach(io: file, filename: im[:photo], content_type: "image/png")
  lis.save
end
