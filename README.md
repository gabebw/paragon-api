Paragon API
===========

An API for finding a picture of someone, based on their email and name.

If you give it emails (`?emails=gabe@example.com,gabe@other.com`), it finds
Gravatars for those emails. If you give it a name (`?name=Gabe+B-W`), it will
include up to 3 image URLs found by Google image searching for that name. You
can include both the `emails` and `name` parameters.

Demo
----

    $ curl 'http://paragon-api.herokuapp.com/?emails=gabe@thoughtbot.com,gabe@other_email.com&name=Gabe%20Berke-Williams' | \
      python -m json.tool

    [
        "http://www.gravatar.com/avatar/1a3fec33b61038721fd4e609c1d1a4b7?d=404&s=150",
        "http://www.gravatar.com/avatar/fd1e26d2d05d25b94f4f73398b2df0d8?d=404&s=150",
        "https://secure.gravatar.com/avatar/1a3fec33b61038721fd4e609c1d1a4b7%3Fs%3D420%26d%3Dhttps://a248.e.akamai.net/assets.github.com%252Fimages%252Fgravatars%252Fgravatar-user-420.png",
        "http://www.thoughtbot.com/assets/people/gabe.jpg",
        "https://si0.twimg.com/profile_images/2165562262/gabe-big_reasonably_small.jpg"
    ]
