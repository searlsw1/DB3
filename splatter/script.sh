#!/usr/bin/ruby
#SEED DB

#USERS
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"User1", "password":"password1"}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"User2", "password":"password1"}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"User3", "password":"password1"}}'

#SPLATTS
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'

curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'

curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'

curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'

curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'

curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test3", "user_id":3}}'



#FOLLOWS
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users/follows -d '{"id":4, "follows_id":1}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users/follows -d '{"id":4, "follows_id":2}'

#GET USER SPLATT
curl -i -H "Content-type: application/json" -X GET http://searles.sqrawler.com:3000/users/splatts/4

#GET USER FOLLOWS
curl -i -H "Content-type: application/json" -X GET http://searles.sqrawler.com:3000/users/follows/4

#GET USER FEED
curl -i -H "Content-type: application/json" -X GET http://searles.sqrawler.com:3000/users/feed/4

#UNFOLLOW
curl -i -H "Content-type: application/json" -X DELETE http://searles.sqrawler.com:3000/users/follows/4/6

#GET FIRST USER FEED
curl -i -H "Content-type: application/json" -X GET http://searles.sqrawler.com:3000/users/feed/4
