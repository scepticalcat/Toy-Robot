# frozen_string_literal: true

def a_number min: 1, max: 100, except: []
  ((min..max).to_a - [*except]).sample
end

def a_string length = 16
  (0...length).map { ("a".."z").to_a[rand(26)] }.join
end
