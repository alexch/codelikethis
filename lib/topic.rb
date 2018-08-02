class Topic < Link

  # todo: validate against topics.json

  def href
    "/topics/#{name}"
  end

end
