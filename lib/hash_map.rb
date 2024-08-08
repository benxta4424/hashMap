require './lib/linkedd_list'

class HashMap

    INITIAL_SIZE=16
    LOAD_FACTOR=0.75

  def initialize(size=INITIAL_SIZE)
    @size=size
    @buckets=Array.new(size)
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

    resize_map if check_load>=0.75

    if @buckets[index].nil?
      @buckets[index]=LinkedList.new     
    end
    @buckets[index].prepend(key,value)
    @length+=1
  end

  def check_load
    @length.to_f/INITIAL_SIZE
  end

  def get_key(key)

    index=hash_key(key)
    bucket=@buckets[index]
    value=bucket.find_key(key)
    if value.nil?
      "The key you are looking for doesn't exist!"
    else
      value
    end

  end

  def has?(key)
    index=hash_key(key)
    current_bucket=@buckets[index]
    value=current_bucket.has_key?(key)

  end

  def remove_key(key)
    index=hash_key(key)
    current_bucket=@buckets[index]
    @length-=1
    return_variable=current_bucket.rm_key(key)
  end

  def length
    puts "The HashMap has #{@length} keys stored"
  end

  def clear
    puts "The HashMap has been cleared!"
    @buckets=Array.new(@size)
  end

  def get_all_keys
    keys=[]

    @buckets.each do |items|
      unless items.nil?
        keys.concat(items.all_keys)
      end
    end
    puts "ALL THE KEYS OF THE HASHMAP:"
    puts keys.join('')

  end

  def get_all_values
    values=[]

    @buckets.each do |items|
      unless items.nil?
        values.concat(items.all_values)
      end
    end
    puts "ALL THE VALUES OF THE HASHMAP:"
    puts values.join('')
  end

  def get_entries
    entries_arr=Array.new

    @buckets.each do |items|
      unless items.nil?
        entries_arr<<"[#{items}]"
      end
    end
    puts entries_arr.inspect
  end

  def resize_map
    all_entries=get_entries
    new_size=INITIAL_SIZE*2
    @buckets=Array.new(new_size)

    all_entries.each do |items|
      
    end

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