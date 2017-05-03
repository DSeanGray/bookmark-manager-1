feature 'Adding tags' do
  scenario 'The link has a tag' do
    visit '/submit'
    fill_in 'title', with: 'Guardian'
    fill_in 'url', with: 'https://guardian.com'
    fill_in 'tags', with: 'Media'
    click_button 'submit'
    links = Links.first
    expect(links.tags.map(&:name)).to include 'Media'
  end
end
