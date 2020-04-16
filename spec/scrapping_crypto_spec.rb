require_relative '../lib/scrapping_crypto'

describe "the name_crypto_in_array function" do
  it "return array, not error" do 
    expect(name_crypto_in_array).to eq(name_crypto_in_array.size > 3)
  end
end

describe "the cours_crypto_in_array function" do
  it "return array, not error" do
    expect(cours_crypto_in_array).to eq(Array)
  end
end

describe "the name_and_cours_in_hash function" do
  it "return array, not error" do 
    expect(name_and_cours_in_hash).to eq(Array)
  end
end


