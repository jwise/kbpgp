

{test_vectors} = require '../data/rfc3394.iced'
{wrap} = require '../../lib/rfc3394'
{AES} = require('triplesec').ciphers

test_vector = (T,n,{key, plaintext, ciphertext}) ->
  key = new Buffer key, 'hex'
  plaintext = new Buffer plaintext, 'hex'
  cipher = { klass : AES, key_size : key.length }
  ct2 = wrap { key, plaintext, cipher }
  T.equal ct2.toString('hex'), ciphertext.toLowerCase(), "#{n} worked"
  T.waypoint "test #{n}"

exports.run_test_vectors = (T,cb) ->
  for n,v of test_vectors
    test_vector T,n,v 
  cb()

