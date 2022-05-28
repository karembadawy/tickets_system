# frozen_string_literal: true

Redis.current = Redis.new(
  url: ENV.fetch('REDIS_HOST'),
  port: ENV.fetch('REDIS_port'),
  db: ENV.fetch('REDIS_DATABASE')
)
