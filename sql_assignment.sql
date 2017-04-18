-- SQL Assignment
-- Check out [W3Schools' SQL Reference](http://www.w3schools.com/sql/sql_syntax.asp) as a reference.

-- Provide one or more SQL queries that retrieve the requested data
-- below each of the following questions:

-- 1) Find the albums recorded by the artist Queen.
chinook_development=# SELECT * FROM artists WHERE name = 'Queen';
id | name  |         created_at         |         updated_at
----+-------+----------------------------+----------------------------
51 | Queen | 2006-01-08 22:57:01.166112 | 2014-01-29 22:10:22.166366

chinook_development=# SELECT * FROM albums WHERE artist_id = 51;
 id  | artist_id |       title       |         created_at         |         updated_at
-----+-----------+-------------------+----------------------------+----------------------------
  36 |        51 | Greatest Hits II  | 2008-01-30 14:00:12.455894 | 2014-01-29 22:14:02.456155
 185 |        51 | Greatest Hits I   | 2007-12-29 12:02:13.672295 | 2014-01-29 22:14:02.672569
 186 |        51 | News Of The World | 2010-06-23 20:50:06.971442 | 2014-01-29 22:14:02.971684


-- 2) [Count](http://www.w3schools.com/sql/sql_func_count.asp) how many tracks belong to the media type "Protected MPEG-4 video file".
chinook_development=# SELECT * FROM media_types;
id  |            name             |         created_at         |         updated_at
----+-----------------------------+----------------------------+----------------------------
  1 | MPEG audio file             | 2006-11-24 08:21:33.800863 | 2014-01-29 22:14:22.80134
  2 | Protected AAC audio file    | 2005-10-15 15:38:18.803463 | 2014-01-29 22:14:22.803915
  3 | Protected MPEG-4 video file | 2007-12-07 13:17:17.805185 | 2014-01-29 22:14:22.805487
  4 | Purchased AAC audio file    | 2012-06-10 16:54:26.806645 | 2014-01-29 22:14:22.806934
  5 | AAC audio file              | 2011-07-19 19:21:12.807909 | 2014-01-29 22:14:22.808152
(5 rows)

chinook_development=# SELECT COUNT(*) FROM tracks WHERE media_type_id = 3;
 count
-------
   214
(1 row)

-- 3) Find the least expensive track that has the genre "Electronica/Dance".
chinook_development=# SELECT * FROM genres;
 id |        name        |         created_at         |         updated_at
----+--------------------+----------------------------+----------------------------
  1 | Rock               | 2008-02-17 12:06:26.896342 | 2014-01-29 22:14:08.896971
  2 | Jazz               | 2006-06-11 22:16:36.899235 | 2014-01-29 22:14:08.899567
  3 | Metal              | 2012-11-15 10:40:49.900941 | 2014-01-29 22:14:08.90127
  4 | Alternative & Punk | 2013-03-04 00:20:35.90248  | 2014-01-29 22:14:08.902773
  5 | Rock And Roll      | 2006-08-25 00:39:25.903877 | 2014-01-29 22:14:08.904128
  6 | Blues              | 2011-03-13 07:33:57.905151 | 2014-01-29 22:14:08.905397
  7 | Latin              | 2008-06-06 11:13:18.906497 | 2014-01-29 22:14:08.906741
  8 | Reggae             | 2005-11-25 11:00:53.907712 | 2014-01-29 22:14:08.907944
  9 | Pop                | 2010-07-12 20:04:53.908872 | 2014-01-29 22:14:08.909092
 10 | Soundtrack         | 2009-06-06 16:55:48.910008 | 2014-01-29 22:14:08.910255
 11 | Bossa Nova         | 2013-11-04 17:47:42.911335 | 2014-01-29 22:14:08.911564
 12 | Easy Listening     | 2010-01-04 02:36:39.912502 | 2014-01-29 22:14:08.912722
 13 | Heavy Metal        | 2013-06-09 11:39:27.913613 | 2014-01-29 22:14:08.913832
 14 | R&B/Soul           | 2004-07-30 05:06:53.914716 | 2014-01-29 22:14:08.914933
 15 | Electronica/Dance  | 2008-05-25 12:13:42.91584  | 2014-01-29 22:14:08.916059
 16 | World              | 2004-07-24 12:29:29.91692  | 2014-01-29 22:14:08.917138
 17 | Hip Hop/Rap        | 2013-01-20 02:04:31.917982 | 2014-01-29 22:14:08.918193
 18 | Science Fiction    | 2004-08-02 15:40:12.919181 | 2014-01-29 22:14:08.919412
 19 | TV Shows           | 2007-08-05 07:31:41.92043  | 2014-01-29 22:14:08.920682
 20 | Sci Fi & Fantasy   | 2008-10-23 01:12:41.921777 | 2014-01-29 22:14:08.922019
 21 | Drama              | 2008-11-02 03:41:13.923004 | 2014-01-29 22:14:08.923221
 22 | Comedy             | 2012-03-31 09:20:08.924112 | 2014-01-29 22:14:08.924331
 23 | Alternative        | 2006-04-21 10:08:22.925228 | 2014-01-29 22:14:08.925447
 24 | Classical          | 2010-10-12 17:26:41.926293 | 2014-01-29 22:14:08.926515
 25 | Opera              | 2006-08-21 02:26:50.927432 | 2014-01-29 22:14:08.927673
(25 rows)

chinook_development=# SELECT name, unit_price FROM tracks WHERE genre_id = 15 ORDER BY unit_price ASC LIMIT 1;
        name        | unit_price
--------------------+------------
 Instinto Colectivo |       0.99
(1 row)


-- 4) Find the all the artists whose names start with A.
chinook_development=# SELECT * FROM artists WHERE name ILIKE 'A%';
 id  |                                         name                                          |         created_at         |         updated_at
-----+---------------------------------------------------------------------------------------+----------------------------+----------------------------
   3 | Aerosmith                                                                             | 2010-04-24 12:10:27.112898 | 2014-01-29 22:10:22.113197
   5 | Alice In Chains                                                                       | 2010-03-17 04:57:44.11445  | 2014-01-29 22:10:22.11471
   6 | Antônio Carlos Jobim                                                                  | 2008-02-20 09:42:01.115821 | 2014-01-29 22:10:22.11609
   7 | Apocalyptica                                                                          | 2007-06-17 17:22:03.117226 | 2014-01-29 22:10:22.117495
  26 | Azymuth                                                                               | 2011-07-06 01:06:45.132896 | 2014-01-29 22:10:22.133127
 159 | Aquaman                                                                               | 2010-01-26 04:30:22.347071 | 2014-01-29 22:10:22.347307
   1 | AC/DC                                                                                 | 2013-12-29 10:17:33.110489 | 2014-01-29 22:10:22.111012
   4 | Alanis Morissette                                                                     | 2006-06-15 08:38:37.349889 | 2014-01-29 22:10:22.350141
   8 | Audioslave                                                                            | 2005-10-31 17:39:42.351213 | 2014-01-29 22:10:22.351435
 166 | Avril Lavigne                                                                         | 2011-07-20 07:13:19.360299 | 2014-01-29 22:10:22.360517
 197 | Aisha Duo                                                                             | 2008-03-13 13:05:56.397849 | 2014-01-29 22:10:22.398099
 202 | Aaron Goldberg                                                                        | 2009-02-25 06:12:10.402279 | 2014-01-29 22:10:22.402526
 215 | Academy of St. Martin in the Fields Chamber Ensemble & Sir Neville Marriner           | 2006-12-17 09:16:04.413592 | 2014-01-29 22:10:22.413807
 222 | Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair | 2006-10-07 18:25:07.420729 | 2014-01-29 22:10:22.420951
 230 | Aaron Copland & London Symphony Orchestra                                             | 2009-05-05 01:44:30.43907  | 2014-01-29 22:10:22.439314
 243 | Antal Doráti & London Symphony Orchestra                                              | 2005-08-14 21:42:30.451626 | 2014-01-29 22:10:22.451976
 252 | Amy Winehouse                                                                         | 2005-10-21 15:27:45.461693 | 2014-01-29 22:10:22.461916
 260 | Adrian Leaper & Doreen de Feis                                                        | 2013-06-19 00:55:12.468704 | 2014-01-29 22:10:22.468925
   2 | Accept                                                                                | 2007-04-29 04:26:44.348404 | 2014-01-29 22:10:22.348709
 161 | Aerosmith & Sierra Leone's Refugee Allstars                                           | 2012-10-20 20:10:32.555428 | 2014-01-29 22:10:22.555661
 206 | Alberto Turco & Nova Schola Gregoriana                                                | 2011-03-23 02:31:01.569619 | 2014-01-29 22:10:22.569862
 209 | Anne-Sophie Mutter, Herbert Von Karajan & Wiener Philharmoniker                       | 2013-04-03 15:04:38.580374 | 2014-01-29 22:10:22.580733
 214 | Academy of St. Martin in the Fields & Sir Neville Marriner                            | 2008-10-12 18:09:43.58192  | 2014-01-29 22:10:22.582178
 239 | Academy of St. Martin in the Fields, Sir Neville Marriner & William Bennett           | 2009-03-18 09:49:24.588641 | 2014-01-29 22:10:22.588875
 257 | Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart             | 2011-01-05 12:55:55.592098 | 2014-01-29 22:10:22.592309
  43 | A Cor Do Som                                                                          | 2006-07-26 01:42:48.501527 | 2014-01-29 22:10:22.501746
(26 rows)


-- 5) Find all the tracks that belong to playlist 1.
SELECT tracks.name FROM playlists_tracks JOIN tracks ON tracks.id = playlists_tracks.track_id WHERE playlists_tracks.playlist_id = 1;
