require 'rails_helper'

RSpec.describe PostsController, type: :controller do 
	describe '#new' do 
		before { get :new }

		it 'returns 200' do 
			expect(response).to be_success
		end

		it 'renders posts/new' do 
			expect(response).to render_template 'posts/new'
		end

		it 'assigns @post' do 
			expect(assigns(:post)).to be_a Post
			expect(assigns(:post)).not_to be_persisted
		end
	end

	describe '#create' do 
		context 'valid params' do 
			before do 
				post :create, post: {
					place: 'Chipotle',
					neighborhood: 'Fidi',
					time: 'Noon',
					body: 'Join me!'
				}
			end

			it 'assigns @post' do 
				expect(assigns(:post)).to be_a Post 
			end

			it 'persists the post' do 
				expect(assigns(:post)).to be_persisted
			end

			it 'redirects to the post' do 
				expect(response).to redirect_to post_path(Post.last)
			end
		end

		context 'invalid params' do 
			before do 
				post :create, post: {
					place: '',
					neighborhood: '',
					time: '',
					body: ''
				}
			end

			it 'assigns @post' do 
				expect(assigns(:post)).to be_a Post 
			end

			it 'does not persist the post' do 
				expect(assigns(:post)).not_to be_persisted
			end

			it 'renders posts/new' do 
				expect(response).to render_template 'posts/new'
			end
		end
	end

	describe '#show' do 
		let!(:post) { FactoryGirl.create(:post) }

		before { get :show, id: post.id }

		it 'returns 200' do 
			expect(response).to be_success
		end

		it 'assigns @post' do 
			expect(assigns(:post)).to eq post
			expect(assigns(:post)).to be_persisted
		end

		it 'renders posts/show' do 
			expect(response).to render_template 'posts/show'
		end 
	end

end