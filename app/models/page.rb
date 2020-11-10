class Page < ApplicationRecord
  validate_uniqueness_of :short_url

  after_save :short_url_size

  ALPHABET =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split(//)

  private

  def short_url_ize
    update_column(short_url: bijective_encode(Page.last.id || 0))
  end

  def bijective_encode(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0

    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def bijective_decode(s)
    # based on base2dec() in Tcl translation
    # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
