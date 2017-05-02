
feature 'View links' do
  scenario 'view a list of links' do
    Links.create(url: 'http://bbc.com', title: 'BBC')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
    expect(page).to have_content 'BBC'
    end
  end
end
