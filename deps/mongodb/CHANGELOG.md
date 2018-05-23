## v0.4.3 (2017-09-16)

* Enhancements
  * Send TLS server name indication (SNI) if none is set in the `:ssl_opts`
  * Fixed a couple dialyzer issues
  * Add basic examples of `$and`, `$or`, and `$in` operators in README

* Bug Fixes
  * Ensure cursor requests are routed to the proper node in the cluster
  * No longer attempting to authenticate against arbiter nodes
  * Prevent monitor errors if you have stopped the mongo process

## v0.4.2 (2017-08-28)

* Bug fixes
  * Fix application crash when a replica set member goes offline
  * Fix application crash on start when a replica set member is offline

## v0.4.1 (2017-08-09)

* Bug fixes
  * Monitors no longer use a pool
  * Can now connect to a Mongo instance using a CNAME
  * Pass options through Mongo.aggregate/4

## v0.4.0 (2017-06-07)

* Replica Set Support

## v0.3.0 (2017-05-11)

* Breaking changes
  * Remove `BSON.DateTime` and replace it with native Elixir `DateTime`

## v0.2.1 (2017-05-08)

* Enhancements
  * SSL support
  * Add functions `BSON.DateTime.to_elixir_datetime/1` and `BSON.DateTime.from_elixir_datetime/1`

* Changes
  * Requires Elixir ~> 1.3

## v0.2.0 (2016-11-11)

* Enhancements
  * Add `BSON.ObjectID.encode!/1` and `BSON.ObjectID.decode!/1`
  * Optimize and reduce binary copying
  * Add tuple/raising versions of functions in `Mongo`
  * Add `:inserted_count` field to `Mongo.InsertManyResult`
  * Support NaN and infinite numbers in bson float encode/decode
  * Add `Mongo.object_id/0` for generating objectids
  * Add `Mongo.child_spec/2`
  * Add `Mongo.find_one_and_update/5`
  * Add `Mongo.find_one_and_replace/5`
  * Add `Mongo.find_one_and_delete/4`

* Bug fixes
  * Fix float endianness

* Breaking changes
  * Switched to using `db_connection` library, see the current docs for changes

## v0.1.1 (2015-12-17)

* Enhancements
  * Add `BSON.DateTime.from_datetime/1`

* Bug fixes
  * Fix timestamp epoch in generated object ids
  * Fix `Mongo.run_command/3` to accept errors without code

## v0.1.0 (2015-08-25)

Initial release
