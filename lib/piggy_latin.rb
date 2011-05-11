module PigLatin

  class Translator
    #how all the words end
    ENDING = "ay"

    def initialize (options = {:dash => true})
      @dash = options[:dash]
    end

    def translate (phrase)
      sentences = phrase.split(".")
      translated_sentences = sentences.map do |sentence|
        translation(sentence) + "."
      end
      translated_sentences.join(" ")
    end

    private

    def translation (phrase)
      words = phrase.split
      translated_words = words.map do |word|
        if vowel_is_first(word)
          translate_with_vowel(word)
        else
          translate_with_consonant(word)
        end
      end
      translated_phrase = translated_words.join(" ")
      if @dash == false
        translated_phrase = translated_phrase.delete("-")
      end
      translated_phrase.capitalize
    end

    def vowel_is_first(word)
      return true if word[0] =~ /a|e|i|o|u|A|E|I|O|U/
      return false
    end

    def translate_with_vowel(word)
      "#{word}-#{"w"+ENDING}"
    end

    def translate_with_consonant(word)
      return "#{word[1]}-#{word[0]+ENDING}" if word.size == 2
      second_segment, first_segment = split(word)
      return "#{first_segment}-#{second_segment+ENDING}"
    end

    def split(word)
      split_location = word =~ /a|e|i|o|u/
      second_segment = word[0,split_location]
      first_segment = word[split_location,word.size]
      return second_segment, first_segment
    end
  end
  
  class Input

    def initialize options
      @options = options
    end

    def translate input
      pig_latin = Translator.new(@options)
      pig_latin.translate(input)
    end

  end
end
#j = PigLatin::Input.new({:dash => false})
#p j.translate("Hi There")
