# coding: utf-8

require 'spec_helper'

RSpec.describe Verse::Alignment, '.align' do

  it "doesn't align unrecognized direction" do
    text = "the madness of men"
    alignment = Verse::Alignment.new(text)
    expect {
      alignment.align(22, :unknown)
    }.to raise_error(ArgumentError, /Unknown alignment/)
  end

  it "fills empty" do
    alignment = Verse::Alignment.new('')
    expect(alignment.center(22)).to eq("                      ")
  end

  it "centers line" do
    text = "the madness of men"
    alignment = Verse::Alignment.new(text)
    expect(alignment.center(22)).to eq("  the madness of men  ")
  end

  it "centers utf line" do
    text = "こんにちは"
    alignment = Verse::Alignment.new(text)
    expect(alignment.center(20)).to eq("     こんにちは     ")
  end

  it "centers multiline text" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    alignment = Verse::Alignment.new(text)
    expect(alignment.center(40)).to eq([
     "   for there is no folly of the beast   \n",
     "           of the earth which           \n",
     "           is not infinitely            \n",
     "     outdone by the madness of men      "
    ].join)
  end

  it "centers multiline utf text" do
    text = "ラドクリフ\n、マラソン五輪\n代表に1万m出\n場にも含み"
    alignment = Verse::Alignment.new(text)
    expect(alignment.center(20)).to eq([
      "     ラドクリフ     \n",
      "   、マラソン五輪   \n",
      "    代表に1万m出    \n",
      "     場にも含み     "
    ].join)
  end

  it "centers multiline text with fill of '*'" do
    text = "for there is no folly of the beast\nof the earth which\nis not infinitely\noutdone by the madness of men"
    alignment = Verse::Alignment.new(text, fill: '*')
    expect(alignment.center(40)).to eq([
     "***for there is no folly of the beast***\n",
     "***********of the earth which***********\n",
     "***********is not infinitely************\n",
     "*****outdone by the madness of men******"
    ].join)
  end
end
