def first_anagram?(word1, word2) #O(n!)
  word1_permutations = permutations_of_word(word1)
  word1_permutations.include?(word2)
end

def permutations_of_word(word)
  return [word] if word.length <= 1
  prev_perms = permutations_of_word(word[0...-1])
  
  result = []
  prev_perms.each do |perm| #perm is a string & prev_perm is an array of strings
    (0..perm.length).each do |i|
      current_perm = perm[0...i] + word[-1] + perm[i..-1]
      result << current_perm
    end
  end
  result
end

def second_anagram?(word1, word2) #O(n^2)
  word2_chars = word2.chars
  word1.each_char do |letter|
    index2 = word2_chars.index(letter) #=> returns a number
    return false if index2 == nil
    word2_chars.delete_at(index2) 
  end
  return false if word2_chars.length >= 1
  true
end


def third_anagram?(word1, word2) #O(n^2) - worst case; O(nlogn) - best case
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  counter_hash1 = Hash.new(0)
  word1.each_char do |ch|
    counter_hash1[ch] += 1
  end
  
  counter_hash2 = Hash.new(0)
  word2.each_char do |ch|
    counter_hash2[ch] += 1
  end
  
  counter_hash1 == counter_hash2
end



