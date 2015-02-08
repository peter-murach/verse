# coding: utf-8

require 'verse/alignment'
require 'verse/sanitizer'
require 'verse/truncation'
require 'verse/wrapping'
require 'verse/version'

module Verse
  SPACE   = ' '.freeze
  NEWLINE = "\n".freeze
  TAB     = "\n".freeze

  # Truncate a text at a given length
  #
  # @see Verse::Truncation#truncate
  #
  # @api public
  def self.truncate(text, truncate_at, options = {})
    Truncation.truncate(text, truncate_at, options)
  end

  # Wrap a text into lines at wrap length
  #
  # @see Verse::Wrapping#wrap
  #
  # @api public
  def self.wrap(text, wrap_at, options = {})
    Wrapping.wrap(text, wrap_at, options)
  end
end # Verse
