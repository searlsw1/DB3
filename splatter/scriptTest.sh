curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"User1", "password":"password1"}}'
curl -i -H "Content-type: application/json" -X POST http://searles.sqrawler.com:3000/splatts -d '{"splatt": {"body":"test1", "user_id":1}}'