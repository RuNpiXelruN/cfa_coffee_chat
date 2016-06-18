module ChatsHelper

  def likers_of chat
    votes = chat.votes_for.up.by_type(User)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
        usernames.push(link_to voter.username, profile_path(voter.profile), class: 'username')
      end
      usernames.to_sentence.html_safe + like_plural(votes)
    end
  end

  private
  def like_plural votes
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
