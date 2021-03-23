require_relative '../lib/card.rb'
require_relative '../lib/turn.rb'

RSpec.describe Turn do

  before :each do
    @example_card = Card.new("What is my name?", "Jon-Boi Caldera", :Personal)
    @turn = Turn.new("gobble gobble", @example_card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("gobble gobble")
  end

  # Checking to see if the Turn class can access an instance of Card
  it 'can access current card' do
    expect(@turn.card).to be_instance_of(Card)
  end

  it 'can detect incorrect card answer' do
    expect(@turn.correct?).to eq(false)
  end

  # Note that upper/lower case matters here.
  # May have to design a way to standardize user inputs.
  it 'can detect correct card answer' do
    correct_turn = Turn.new("Jon-Boi Caldera", @example_card)

    expect(correct_turn.correct?).to eq(true)
  end

  # This test had to be written after the other feedback tests to debug nil
  # being returned by feedback method.
  # Bug Cause: outputting feedback to screen, but not explicitly returning value
  it 'has feedback result that is not nil' do
    expect(@turn.feedback).not_to be(nil)
  end

  it 'can output correct feedback' do
    correct_response = "Correct!"
    correct_turn = Turn.new("Jon-Boi Caldera", @example_card)

    expect(correct_turn.feedback).to eq(correct_response)
  end

  it 'can output incorrect feedback' do
    incorrect_response = "Incorrect."

    expect(@turn.feedback).to eq(incorrect_response)
  end

end