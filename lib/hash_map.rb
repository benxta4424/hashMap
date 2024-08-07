require './lib/linkedd_list'

class HashMap

    INITIAL_SIZE=16
    LOAD_FACTOR=0.75

  def initialize(size=INITIAL_SIZE)
    @size=size
    @buckets=Array.new(size) {LinkedList.new}
    @length=0
  end

  def hash_key(key)
    hash_code = 0
    prime_number = 31       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code % @size
  end

  def set(key,value)
    index=hash_key(key)

    raise IndexError if index.negative? || index >= @buckets.length

    if @buckets[index].nil?
      @buckets[index]=LinkedList.new     
    end

    @buckets[index].prepend(key,value)
    @length+=1
  end

  def check_load
    @length.to_f/INITIAL_SIZE
  end

  def to_s
    elements=[]

    @buckets.each_with_index do |items,index|
      unless items.nil?
        elements<<"Bucket #{index}   #{items}"
      end
    end
    
    elements.join("\n")
  end


end