class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.alls
    end
  end

    def new?
      create?
    end
    
    def create?
      user&.has_role? :write
    end

    def edit? 
      update?
    end

    def update?
      # se é admin
      # user&.admin?
      # se é dono do artigo
      user&.has_role? :editor || user&.id == record.user_id
    end

    def destroy?
      # se é admin
      # user&.admin?
      # se é dono do artigo
      user&.admin? || user&.id == record.user_id
    end
end
