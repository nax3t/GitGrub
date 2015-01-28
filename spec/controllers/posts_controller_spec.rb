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

		# it 'assigns @comment to post' do
		# 		expect(assigns(:comment)).to be_a Comment			
		# end #will fail until build comment form on post show page
	end

	describe '#edit' do 
		let!(:post) { FactoryGirl.create(:post) }

		before { get :edit, id: post.id }

		it 'returns 200' do 
			expect(response).to be_success
		end

		it 'assigns @post' do 
			expect(assigns(:post)).to eq post 
		end

		it 'renders posts/edit' do 
			expect(response).to render_template	'posts/edit'
		end
	end

	describe '#update' do 
		let!(:post) { FactoryGirl.create(:post) }

		context 'valid params' do 
			before do 
				patch :update, id: post.id, post: {
					place: 'new place',
					neighborhood: 'new neighborhood',
					time: 'new time',
					body: 'new body'
				}
			end

			it 'updates the post' do 
				post = assigns(:post).reload
				expect(post.place).to eq 'new place'
				expect(post.neighborhood).to eq 'new neighborhood'
				expect(post.time).to eq nil
				expect(post.body).to eq 'new body'
			end

			it 'assigns @post' do 
				expect(assigns(:post)).to eq post 
			end

			it 'redirects to the post' do 
				expect(response).to redirect_to post_path(post)
			end
		end

		context 'invalid params' do 
			before do 
				patch :update, id: post.id, post: {
					place: '',
					neighborhood: '',
					time: '',
					body: ''
				}
			end

			it 'does not update the post' do 
				post = assigns(:post).reload
				expect(post.place).not_to eq ''
				expect(post.neighborhood).not_to eq ''
				expect(post.time).not_to eq ''
				expect(post.body).not_to eq ''
			end

			it 'assigns @post' do 
				expect(assigns(:post)).to eq post 
			end 

			it 'renders posts/edit' do 
				expect(response).to render_template 'posts/edit'
			end
		end
	end

	describe '#destroy' do 
		let!(:post) { FactoryGirl.create(:post) }

		it 'destroys a post' do 
			expect { 
				delete :destroy, id: post.id
			}.to change(Post, :count).by(-1)
		end

		it 'redirects to #index' do 
			delete :destroy, id: post.id 
			expect(response).to redirect_to posts_path
		end
	end

end