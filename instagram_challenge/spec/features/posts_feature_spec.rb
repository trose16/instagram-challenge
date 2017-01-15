require 'rails_helper'

feature 'posts' do
  context 'when no posts have been added' do
    scenario 'display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'You have no posts yet'
      expect(page).to have_link 'Add a new photo or video'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'My Cat Mr. Paws')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My Cat Mr. Paws')
      expect(page).not_to have_content('You have no posts yet')
    end
  end


end
