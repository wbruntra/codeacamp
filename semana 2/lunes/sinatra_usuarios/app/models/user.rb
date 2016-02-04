class User < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
    @user = User.find_by(email: email)
    if (@user)
      if (@user.email == email && @user.password == password)
        return @user
      else
        return nil
      end
    end
  end

end
