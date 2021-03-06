class PostPolicy < ApplicationPolicy
  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where("published = true or author_id = ?", user.id)
      else
        scope.where(:published => true)
      end
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @posts = policy_scope(Post)
  end

  def show?
    @posts = policy_scope(Post)
  end

  def create?
    user.author? || user.editor? if user.present?
  end

  def update?
    (user.author? && (@user.id == @post.author_id)) || user.editor? if user.present?
  end

  def destroy?
    user.editor? if user.present?
  end

  def publish?
    user && (user.editor?)
  end
end
