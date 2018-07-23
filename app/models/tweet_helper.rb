module TweetHelper
  def get_tagged(tweet)
    message_arr = tweet.message.split

    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        tag = Tag.find_or_create_by(phrase: word.downcase)
        TweetTag.create(tag_id: tag.id, tweet_id: tweet.id)
        message_arr[index] = "<a href = '/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
    end

    tweet.message = message_arr.join(' ')
    tweet.save
  end
end
