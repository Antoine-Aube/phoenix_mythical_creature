# Create the Phoenix class here
class Phoenix
  attr_reader :name, :color, :mood, :pharaoh, :emotional_awareness, :reborn
  def initialize(name, color = "golden", mood = "stoic")
    @name = name
    @color = color
    @mood = mood
    @pharaoh = nil 
    @emotion_counter = 0
    @emotional_awareness = {}
    @tear_released = false
  end
  def feels_emotion(emotion)
    @emotion_counter += 1
    update_color_and_mood
    update_emotional_awareness(emotion)
    if @emotional_awareness.any? { |emotion, count| count % 5 == 0 } == true
      self.reborn
      emotional_awareness.clear 
    end
  end
  
  def update_color_and_mood
    if @emotion_counter == 1
      @color = "amber"
      @mood = "heated"
    elsif @emotion_counter == 2
      @color = "scarlet"
      @mood = "fiery"
    elsif @emotion_counter == 3
      @color = "crimson"
      @mood = "ablaze"
    else @emotion_counter == 4
      @color = "deep violet"
      @mood = "incandescent"
    end
  end
  def releases_tear?
    # emotional_awareness.each do |emotion, count|
    #   if count % 3 == 0
    #     tear_released = true 
    #     return tear_released
    #   end
    # end 
    #   @tear_released = false
    #refactored to the below
      @tear_released = @emotional_awareness.any? { |emotion, count| count % 3 == 0 }
  end
  def reborn
    @color = "golden"
    @mood = "stoic"
  end
  def update_emotional_awareness(emotion)
    @emotional_awareness[emotion] = @emotional_awareness.fetch(emotion, 0) + 1 
  end
end

# def update_emotional_awareness(emotion)
#   @emotional_awareness[emotion] = @emotional_awareness.fetch(emotion, 0) + 1 
# end