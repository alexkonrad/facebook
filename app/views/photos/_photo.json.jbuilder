json.(photo, :id, :filename)
json.photo_small photo.filename.url(:small)
json.photo_large photo.filename.url(:large)
json.created_at time_ago_in_words(photo.created_at)

json.commentable_id photo.id
json.commentable_type "Photo"

json.user do |json|
  json.(photo.user, :id, :username, :profile_picture)
  json.profile_picture photo.user.profile_picture.url(:small)
end

json.comments photo.comments do |comment|
  json.(comment, :id, :body, :created_at)
  json.author do |json|
    json.(comment.author, :id, :username, :profile_picture)
    json.profile_picture comment.author.profile_picture.url(:small)
  end
end

json.tags photo.tags do |tag|
  json.(tag, :id, :photo_id, :tagged_id, :tagger_id)
  json.tagger do |json|
    json.(tag.tagger, :username)
  end
  json.tagged do |json|
    json.(tag.tagged, :username)
  end
end

json.likes photo.likes do |like|
  json.(like, :id, :likeable_id, :likeable_type, :user_id)
end

json.liking_user_ids photo.likes.pluck(:user_id)

json.current_user_id current_user.id