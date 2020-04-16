require_relative '../lib/mairie_christmas'

describe "the get_townhall_urls function" do
  it "return array, not error" do 
    expect(get_townhall_urls).to eq(String)
  end
end