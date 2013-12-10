require 'spec_helper'
describe "User pages" do
	subject { page }
	describe "index" do
		before do
			sign_in FactoryGirl.create(:user)
			FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
			FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
			visit users_path
		end

		it { should have_title('Usuários') }
		it { should have_content('Usuários') }

		describe "pagination" do

			before(:all) { 30.times { FactoryGirl.create(:user) } }
			after(:all)  { User.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each user" do
				User.paginate(page: 1).each do |user|
					expect(page).to have_selector('li', text: user.name)
				end
			end
		end
		describe "delete links" do

			it { should_not have_link('delete') }

			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
				before do
					sign_in admin
					visit users_path
				end

				it { should have_link('deletar', href: user_path(User.first)) }
				it "should be able to delete another user" do
					expect do
						click_link('deletar', match: :first)
					end.to change(User, :count).by(-1)
				end
				it { should_not have_link('deletar', href: user_path(admin)) }
			end
		end
	end
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		it { should have_content(user.name) }
		it { should have_title(user.name) }

	end
	describe "signup page" do
		before { visit signup_path }
		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end
	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Salvar" } 

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end
		describe "with valid information" do
			before do
				fill_in "Nome", 	with:  "Example User"
				fill_in "Email", 	with:  "user@example.com"
				fill_in "Senha",	with:  "foobar"
				fill_in "Confirmação de Senha", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by(email: 'user@example.com') }
				it { should have_link('Sign out') }
				it { should have_title(user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Bem vindo a Receitas Online!') }
			end
		end
	end
	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do 
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Edite seu perfil") }
			it { should have_title("Edit user") }
			it { should have_link("change", href: 'http://gravatar.com/emails') }
		end

		describe "with valid information" do
			let(:new_name)  { "New Name" }
			let(:new_email) { "new@example.com" }

			before do
				fill_in "Nome", 	with: new_name
				fill_in "Email", 	with: new_email
				fill_in "Senha",	with:  user.password
				fill_in "Confirmação de Senha", with: user.password
				click_button "Salvar"
			end

			it { should have_title(new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.name).to  eq new_name }
			specify { expect(user.reload.email).to eq new_email }
		end
	end
end
