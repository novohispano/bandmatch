module ObjectCreationMethods
  def new_plan(overrides = {})
    defaults = {
      description: "test description",
      start:       DateTime.parse("10 January 2015"),
      location:    "39.74,-104.98"
    }

    Plan.new(defaults.merge(overrides))
  end

  def create_plan(overrides = {})
    plan = new_plan(overrides)
    plan.save
    plan
  end

  def new_user(overrides = {})
    defaults = {
      provider:         "facebook",
      uid:              "100005981503757",
      name:             "James Ameihaejcgeg Wongescu",
      oauth_token:      "CAAIc1b7yEMoBAOwV6L5wWEvhwBHAgfq7Diu7zzTZBWNO0wjV6VxhFClEB5bURmFuhjm11dk7CBIBGQgO6YUUdvkUam4MqnWUZCh5Y1lbmGoI2JfFGz77Ox15rUwuQ9u819mPbEseT9lpClZAZAxt",
      oauth_expires_at: DateTime.parse("Thu, 01 Aug 2013 23:28:47 UTC +00:00"),
      email:            "jwong@test.com",
      image:            "http://graph.facebook.com/100005981503757/picture?type=square",
      location:         "New York, New York"
    }

    User.new(defaults.merge(overrides))
  end

  def create_user(overrides = {})
    user = new_user
    user.save
    user
  end
end