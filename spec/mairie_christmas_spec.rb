require_relative '../lib/mairie_christmas'

describe "the get_townhall_urls method" do
  it "should not be nil or false" do
    expect(get_townhall_urls).to be
  end

  it "should be a string" do
    expect(get_townhall_urls).to be_a(Array)
  end
end

describe "the get_townhall_name method" do
  it "should not be nil or false" do
    expect(get_townhall_name).to be
  end

  it "should be a string" do
    expect(get_townhall_name).to be_a(Array)
  end

  it "should have an string in it" do
    expect(get_townhall_name).to include(String)
  end
end

describe "the extract_email_of_url method" do
  it "should not be nil or false" do
    expect(extract_email_of_url(get_townhall_urls)).to be
  end

  it "should be a string" do
    expect(extract_email_of_url(get_townhall_urls)).to be_a(Array)
  end

  it "should have an String in it" do
    expect(extract_email_of_url(get_townhall_urls)).to include(String)
  end
end

describe "the name_and_emails_in_hash method" do
  it "should not be nil or false" do
    expect(name_and_emails_in_hash(get_townhall_name, extract_email_of_url(get_townhall_urls))).to be
  end

  it "should be a string" do
    expect(name_and_emails_in_hash(get_townhall_name, extract_email_of_url(get_townhall_urls))).to be_a(Array)
  end
end
