
feature 'Add link' do
  scenario 'submit a new link and see it has been added' do
    visit '/submit'
    fill_in 'title', with: 'Guardian'
    fill_in 'url', with: 'https://guardian.com'
    click_button 'submit'
    within 'ul#links' do
    	expect(page).to have_content 'Guardian'
    end
  end
end