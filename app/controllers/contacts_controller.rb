class ContactsController < ApplicationController
  # def index
  #  @blogs = Blog.all
  # end

  def new
  # @contact = Contact.new
    if params[:back]
    @contact = Contact.new(contacts_params)
    else
    @contact = Contact.new
    end
  end

  def create
  #  Contact.create(contacts_params)
  #  redirect_to new_contact_path
    @contact = Contact.new(contacts_params)
    if @contact.save
      # 入力画面へ遷移して以下メッセージをを表示する。
      # redirect_to new_contact_path, notice: "お問い合わせありがとうございました！"
      redirect_to root_path, notice: "お問い合わせありがとうございました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
