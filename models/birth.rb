require 'bundler/setup'
Bundler.require
if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class User < ActiveRecord::Base
    has_many :messages
    has_many :users_friends
    has_many :friends, :through => :users_friends
end

class Message < ActiveRecord::Base
    belongs_to :user
end

class Friend < ActiveRecord::Base
    has_many :users_friends
    has_many :users, :through => :users_friends
end

class UsersFriends < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend
end