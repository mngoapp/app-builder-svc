

What does Kafka do?
* Receives messages from applications
* Keeps those messages in the order they were received in
* Allows other applications to read those messages in order

* Sharing data amongst services
* Guaranteeing standard message schemas across different services

## Sharing data amongst services

A use case for Kafka: Say we want to keep an activity log for users. Every time a user triggers an event on your website - logs in, makes a search, clicks a banner, etc. - you want to log that activity. You also want to allow multiple services to access this activity log, such as a marketing tracker, user data aggregator, and of course your website’s front-end application. Rather than persisting each activity to your own database, we can send them to Kafka and allow all these applications to read only what they need from it.

This ultimately translates to solve the problem of sharing data amongst services. 

## Guaranteeing standard message schemas across different services
One trouble spot we’ve encountered in micro-services is guaranteeing standard message schemas across different services. It’s reasonably common for a developer to make a small change to a message that unexpectedly breaks other services.
To avoid this issue outright, we’ve chosen to use Apache Avro. Avro is a binary data format coupled with built-in schema validation. Avro allows us to encode messages with a given schema and guarantee any application that receives an encoded message will decode it with the correct schema.
We also want to guarantee all applications have access to the latest correct schemas. 