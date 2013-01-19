Paragon
=======

An API for finding a picture of someone, based on their email.

Demo
----

    $ curl 'http://paragon-api.herokuapp.com/?gabe=gabe@thoughtbot.com,gabe@backup-email.com&jim=jim@example.com' | python -m json.tool

    {
        "gabe": [
            "http://www.gravatar.com/avatar/1a3fec33b61038721fd4e609c1d1a4b7?d=404&s=150",
            "http://www.gravatar.com/avatar/32ff7ab17eaf7779171ca85b001e3900?d=404&s=150"
        ],
        "jim": [
            "http://www.gravatar.com/avatar/db40f846ab0a3b10522f83c6ae657e31?d=404&s=150"
        ]
    }
