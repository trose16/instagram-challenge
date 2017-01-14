require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'You have no posts yet'
      expect(page).to have_link 'Add a new photo or video'
    end
  end



end