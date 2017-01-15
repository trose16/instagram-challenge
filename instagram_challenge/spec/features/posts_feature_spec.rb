require 'rails_helper'

feature 'posts' do
  context 'when no posts have been added' do
    scenario 'display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'You have no posts yet'
      expect(page).to have_link 'Add a new photo or video'
    end
  end

  context 'when posts have been added' do
    before do
      Post.create(name: 'My Cat Mr. Paws')
    end

    scenario 'it will display posts' do
      visit '/posts'
      expect(page).to have_content('My Cat Mr. Paws')
      expect(page).not_to have_content('You have no posts yet')
    end

    scenario 'CREATE: it prompts user to add an image, then displays the new picture' do
        visit '/posts'
        click_link 'Add a new photo or video'
        fill_in 'Name', with: 'My Cat Mr. Paws'
        fill_in 'Caption', with: 'Adorable Mr. Paws eats soup'
        click_button 'Upload Image'
        expect(page).to have_content 'My Cat Mr. Paws'
        expect(current_path).to eq '/posts'
      end

  end


end
