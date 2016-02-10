def add_post(title,author,body,tags)
  post_dict = {
    'author' => author,
    'title' => title,
    'body' => body
  }
  post = Post.create(post_dict)
  post_id = post.id
  for tag in tags do
    working_tag = Tag.find_by(name: tag)
    if !working_tag
      working_tag = Tag.create(name: tag)
    end
    tag_id = working_tag.id
    connection_dict = {
      'post_id' => post_id,
      'tag_id' => tag_id}
    connection = Connection.create(connection_dict)
  end
end
