require './lib/linkedd_list'

class HashMap

    INITIAL_SIZE=16
    LOAD_FACTOR=0.75

  def initialize(size=INITIAL_SIZE)
    @size=size
    @buckets=Array.new(size) {LinkedList.new}
    @length=nil
  end

  def hash_key(key)
    hash_code = 0
    prime_number = 31
    size=@size
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code%size
  end

  def set(key,value)
    index=hash_key(key)

    raise IndexError if index.negative? || index >= @buckets.length

    if @buckets[index].nil?
      @buckets[index]=LinkedList.new
      @length+=1
    end
    @buckets[index].prepend(key,value)
    

  end

  def to_s
    elements=[]

    @buckets.each_with_index do |items,index|
      elements<<"Buckets #{index}:#{items}" unless items.nil?
    end
    
    elements
  end


end