class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

    def render
      renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :hard_wrap => true)
      self.description.try(:strip!)
      self.description ? renderer.render(self.description) : ''
    end

end
