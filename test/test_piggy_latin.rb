require_relative '../lib/piggy_latin'
require 'test/unit'

class TestPigLatin < Test::Unit::TestCase

  def test_two_letters_non_vowel_nodash
    pig_latin = PigLatin::Translator.new(:dash => false)
    assert_equal(pig_latin.translate("Hi."),"Ihay.")
  end

  def test_two_letters_vowel_nodash
    pig_latin = PigLatin::Translator.new(:dash => false)
    assert_equal(pig_latin.translate("At."),"Atway.")
  end

  def test_single_letter_word_nodash
    pig_latin = PigLatin::Translator.new(:dash => false)
    assert_equal(pig_latin.translate("This is a test sentence."),"Isthay isway away esttay entencesay.")
  end

  def test_two_letters_non_vowel_dash
    pig_latin = PigLatin::Translator.new(:dash => true)
    assert_equal(pig_latin.translate("Hi."),"I-hay.")
  end

end
