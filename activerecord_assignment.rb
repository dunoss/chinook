### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".
irb(main):004:0> Genre.find_by(name: 'Hip Hop/Rap')
  Genre Load (0.7ms)  SELECT  "genres".* FROM "genres" WHERE "genres"."name" = $1 LIMIT $2  [["name", "Hip Hop/Rap"], ["LIMIT", 1]]
=> #<Genre id: 17, name: "Hip Hop/Rap", created_at: "2013-01-20 02:04:31", updated_at: "2014-01-29 22:14:08">


# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre
irb(main):008:0> Track.where(genre_id: 17).count
   (2.8ms)  SELECT COUNT(*) FROM "tracks" WHERE "tracks"."genre_id" = $1  [["genre_id", 17]]
=> 35


# 2) Find the total amount of time required to listen to all the tracks in the database.
Track.sum("milliseconds")


# 3a) Find the highest price of any track that has the media type "MPEG audio file".
Track.where(media_type_id: MediaType.find_by(name: 'MPEG audio file')).order(unit_price: :desc).limit(1).first


# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".
<Track id: 6, album_id: 1, genre_id: 1, media_type_id: 1, name: "Put The Finger On You", composer: "Angus Young, Malcolm Young, Brian Johnson", milliseconds: 205662, bytes: 6713451, unit_price: <BigDecimal:7fceefede7a0,'0.99E0',9(18)>, created_at: "2005-01-03 05:49:26", updated_at: "2014-01-29 22:14:56">


# 4) Find the 2 oldest artists.
irb(main):014:0> Artist.order(created_at: :asc).limit(2)
  Artist Load (7.0ms)  SELECT  "artists".* FROM "artists" ORDER BY "artists"."created_at" ASC LIMIT $1  [["LIMIT", 2]]
=> #<ActiveRecord::Relation [#<Artist id: 258, name: "Les Arts Florissants & William Christie", created_at: "2004-02-13 06:08:36", updated_at: "2014-01-29 22:10:22">, #<Artist id: 31, name: "Baby Consuelo", created_at: "2004-02-16 22:04:39", updated_at: "2014-01-29 22:10:22">]>


### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.
Album.where('title ilike ?', 'B%')
